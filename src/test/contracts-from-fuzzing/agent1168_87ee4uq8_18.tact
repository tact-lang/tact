struct HasRemaining {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract RemainingFieldContract {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            prefix: 999,
            suffix: beginCell().storeUint(0, 1).endCell().asSlice()
        };
    }
}