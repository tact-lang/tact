struct Inner {
    x: Int;
    y: Bool;
}

contract NestedTest {
    coord: Inner;

    init() {
        self.coord = Inner{x: 10, y: true};
    }

    receive() {
        self.coord = Inner{x: self.coord.x + 1, y: !self.coord.y};
    }
}