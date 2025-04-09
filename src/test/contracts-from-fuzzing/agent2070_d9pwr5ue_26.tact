struct SWithRemaining {
    data: Slice as remaining;
}

contract NonNestedRemaining {
    r: SWithRemaining;

    init() {
        self.r = SWithRemaining{
            data: beginCell().storeUint(1,1).endCell().asSlice()
        };
    }
}