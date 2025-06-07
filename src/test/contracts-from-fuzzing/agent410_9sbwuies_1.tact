struct Point { x: Int as int64; y: Int as int64; }

contract TestContract {
    point: Point; 

    init() {
        self.point = Point{ x: 1, y: 2 };
    }
}
