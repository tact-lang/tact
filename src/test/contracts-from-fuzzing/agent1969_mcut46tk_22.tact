struct WithRemaining {
    prefix: Int;
    data: Slice as remaining;
}

contract RemainTest {
    field: WithRemaining;

    init() {
        self.field = WithRemaining{prefix: 1, data: emptyCell().asSlice()};
    }
}