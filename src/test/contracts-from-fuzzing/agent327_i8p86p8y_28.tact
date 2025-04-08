struct RemainStruct {
    data: Slice as remaining;
}

contract RemainTest {
    r: RemainStruct;
    init() {
        self.r = RemainStruct{ data: emptyCell().asSlice() };
    }
}