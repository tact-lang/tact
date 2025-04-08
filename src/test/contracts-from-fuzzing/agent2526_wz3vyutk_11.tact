struct Position {
    x: Int;
    y: Int;
    z: Int;
}

contract TestStorage {
    pos: Position;

    init() {
        self.pos = Position{ x: 1, y: 2, z: 3 };
    }
}