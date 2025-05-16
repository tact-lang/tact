struct RemainingStruct {
    data: Slice as remaining;
}

contract RemainingField {
    info: RemainingStruct;

    init() {
        self.info = RemainingStruct{
            data: emptyCell().asSlice()
        };
    }
}