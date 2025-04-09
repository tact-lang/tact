struct RemainingStruct {
    mainPart: Int;
    tail: Slice as remaining;
}

contract TestRemaining {
    field: RemainingStruct;
    init() {
        self.field = RemainingStruct{
            mainPart: 123,
            tail: emptyCell().asSlice()
        };
    }
}