struct RemainStruct {
    data: Slice as remaining;
}

contract RemainingFieldTest {
    s: RemainStruct;
    init() {
        self.s = RemainStruct{ data: emptyCell().asSlice() };
    }
}