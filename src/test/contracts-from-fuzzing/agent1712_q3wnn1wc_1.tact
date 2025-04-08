struct Coord {
    x: Int;
    y: Int;
}

contract NestedStructTest {
    position: Coord;
    
    init() {
        self.position = Coord{ x: 5, y: 10 };
    }
}