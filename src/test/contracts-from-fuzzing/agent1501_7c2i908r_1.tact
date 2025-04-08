struct Pos {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: Pos;

    init() {
        self.pos = Pos{ x: 1, y: 2 };
    }
}