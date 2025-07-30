struct WithRemaining {
    data: Cell as remaining;
}

contract RemainingCellField {
    payload: WithRemaining;

    init() {
        self.payload = WithRemaining{
            data: emptyCell(),
        };
    }
}