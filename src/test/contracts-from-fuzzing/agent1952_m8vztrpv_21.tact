struct WithSlice {
    a: Slice;
    b: Int;
}

contract TestContract {
    ws: WithSlice;

    init() {
        self.ws = WithSlice{
            a: emptyCell().asSlice(),
            b: 42,
        };
    }
}
