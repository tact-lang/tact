struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract TestContract {
    point: Coord = Coord{x: 1, y: 2};
    
    init() {
        self.point = Coord{x: 3, y: 4};
    }
}