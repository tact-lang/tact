struct Point { x: Int; y: Int; }

contract Coord { 
    p: Point; 

    init() {
        self.p = Point{ x: 10, y: 20 };
    }
}