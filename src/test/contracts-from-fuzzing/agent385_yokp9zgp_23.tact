struct WithRemaining {
    prefix: Int as uint4;
    data: Cell as remaining;
}

contract RemainingFieldTest {
    testField: WithRemaining;

    init() {
        self.testField = WithRemaining{
            prefix: 3,
            data: emptyCell()
        };
    }
}