struct HasRemaining {
    a: Int;
    payload: Slice as remaining;
}

contract ContractWithRemaining {
    s: HasRemaining;

    init() {
        self.s = HasRemaining{
            a: 5,
            payload: beginCell().endCell().asSlice()
        };
    }
}