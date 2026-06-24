struct RemainingStruct {
    a: Int as uint16;
    extra: Slice as remaining;
}

contract RemainingFieldStruct {
    data: RemainingStruct;

    init() {
        self.data = RemainingStruct{ a: 100, extra: emptyCell().asSlice() };
    }
}