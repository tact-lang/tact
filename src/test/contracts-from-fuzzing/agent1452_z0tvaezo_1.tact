struct Coord {
    x: Int;
    y: Int;
}

contract NestedStructTest {
    data: Coord;

    init() {
        self.data = Coord{x: 5, y: 10};
    }
}