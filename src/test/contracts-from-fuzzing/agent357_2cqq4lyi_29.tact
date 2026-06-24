struct RemainingStruct {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract RemainingStructStorage {
    data: RemainingStruct;

    init() {
        self.data = RemainingStruct{
            prefix: 17,
            suffix: emptyCell().asSlice(),
        };
    }
}