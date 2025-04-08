struct ComposeRemaining {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract TestContract {
    payload: ComposeRemaining;

    init() {
        self.payload = ComposeRemaining{
            prefix: 999,
            suffix: emptyCell().asSlice()
        };
    }
}