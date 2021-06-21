import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var places: Int
    
    init(n: Int) {
        places = n
    }
    
    func seat() -> Int {
        var maxDistance = 0
        var position = 0
        var seat = 0
        
        if seats.count == 0 {
            seats.append(0)
            return 0
        }
        if seats.first != 0 {
            seat = 0
            seats.insert(seat, at: 0)
            return seat
        }
        if seats.last != places - 1 && seats.count < 2 {
            seats.append(places - 1)
            seat = places - 1
        } else {
            for i in 1 ..< seats.count {
                if (seats[i] - seats[i - 1]) / 2 > maxDistance {
                    maxDistance = (seats[i] - seats[i - 1]) / 2
                    position = i
                    seat = seats[i - 1] + maxDistance
                }
            }
            
            if seats.last != places - 1 {
                if places - 1 - seats.last! > maxDistance {
                    seat = places - 1
                    seats.append(places - 1)
                    return seat
                }
            }
            seats.insert(seat, at: position)
        }
        
        return seat
    }
    
    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
    }
}
