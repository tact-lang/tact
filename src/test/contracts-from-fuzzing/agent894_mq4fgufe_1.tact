struct Coordinate {
    x: Int;
    y: Int;
}

contract NestedStructStorage {
    point: Coordinate;
    
    init() {
        self.point = Coordinate{ x: 5, y: 10 };
    }
}