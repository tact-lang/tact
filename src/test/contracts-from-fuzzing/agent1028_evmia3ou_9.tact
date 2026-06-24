struct RemainderStruct {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract PersistentRemainingField {
    data: RemainderStruct;

    init() {
        self.data = RemainderStruct{
            prefix: 42,
            suffix: emptyCell().asSlice(),
        };
    }
}
