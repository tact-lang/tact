struct Coordinates {
    x: Int;
    y: Int;
}

contract TestCoord {
    pos: Coordinates;

    init() {
        self.pos = Coordinates{ x: 1, y: 2 };
    }

    receive() {
        self.pos = Coordinates{ x: 3, y: 4 };
    }
}