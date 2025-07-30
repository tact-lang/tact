struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    maybePoint: Coord?;

    init() {
        self.maybePoint = Coord{ x: 1, y: 2 };
    }
}