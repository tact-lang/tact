struct Coord {
    x: Int as int16;
    y: Int as int16;
}

contract NestedWithSerialization {
    point: Coord;
    
    init() {
        self.point = Coord{ x: -100, y: 100 };
    }
}
