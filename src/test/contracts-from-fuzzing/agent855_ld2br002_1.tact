struct Point { x: Int; y: Int }

contract TestContract {
    p: Point;
    
    init() {
        self.p = Point{ x: 1, y: 2 };
    }
}