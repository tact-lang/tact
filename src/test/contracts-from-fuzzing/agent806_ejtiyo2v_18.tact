struct WithRemaining {
    part1: Int;
    more: Cell as remaining;
}

contract TestContract {
    info: WithRemaining;
    init() {
        self.info = WithRemaining{
            part1: 42,
            more: emptyCell()
        };
    }
}