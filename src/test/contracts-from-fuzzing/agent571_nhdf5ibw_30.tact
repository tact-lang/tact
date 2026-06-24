struct WithSlice {
    prefix: Int;
    data: Slice as remaining;
}

contract TestContract {
    payload: WithSlice;

    init() {
        self.payload = WithSlice{prefix: 99, data: emptyCell().asSlice()};
    }
}