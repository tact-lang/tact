struct WithRemaining {
    val: Int;
    rest: Cell as remaining;
}

contract RemainPersist {
    s: WithRemaining;

    init() {
        self.s = WithRemaining{ val: 7, rest: emptyCell() };
    }
}