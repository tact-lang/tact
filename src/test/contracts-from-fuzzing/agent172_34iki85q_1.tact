struct Position {
    x: Int as int64;
    y: Int as int64;
}

contract PositionHolder {
    pos: Position;

    init() {
        self.pos = Position{
            x: 123,
            y: 456,
        };
    }
}