struct WithRemaining {
    x: Int;
    y: Cell as remaining;
}

contract ContractWithRemaining {
    s: WithRemaining;
    init() {
        self.s = WithRemaining{ x: 1, y: emptyCell() };
    }
}