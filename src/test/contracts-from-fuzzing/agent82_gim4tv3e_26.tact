struct HasRemaining {
    content: Slice as remaining;
}

contract Test {
    s: HasRemaining;

    init() {
        self.s = HasRemaining{
            content: beginCell().storeUint(123,8).endCell().asSlice()
        };
    }
}
