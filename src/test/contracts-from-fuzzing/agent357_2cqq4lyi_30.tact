struct RemainingNested {
    head: Int;
    nested: RemainingStruct;
}

struct RemainingStruct {
    prefix: Int as uint16;
    suffix: Slice as remaining;
}

contract RemainingNestedStorage {
    data: RemainingNested;

    init() {
        self.data = RemainingNested{
            head: 1,
            nested: RemainingStruct{
                prefix: 42,
                suffix: emptyCell().asSlice(),
            },
        };
    }
}