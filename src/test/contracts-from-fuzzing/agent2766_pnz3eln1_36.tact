struct RemainingStruct {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainingInPersistent {
    data: RemainingStruct;

    init() {
        self.data = RemainingStruct{
            prefix: 42,
            suffix: emptyCell().asSlice(),
        };
    }
}