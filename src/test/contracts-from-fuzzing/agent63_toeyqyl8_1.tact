struct Coordinates {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: Coordinates;

    init() {
        self.pos = Coordinates{ x: 10, y: 20 };
    }
}