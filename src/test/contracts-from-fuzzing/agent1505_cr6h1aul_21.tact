struct WithRemaining {
    prefix: Int as uint8;
    rest: Cell as remaining;
}

contract RemainField {
    x: WithRemaining;
    init() {
        self.x = WithRemaining{ prefix: 42, rest: emptyCell() };
    }
}