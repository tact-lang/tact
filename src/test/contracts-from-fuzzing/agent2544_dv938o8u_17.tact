struct RemainStruct {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract MultipleRemain {
    a: RemainStruct;
    b: RemainStruct;
    init() {
        self.a = RemainStruct{ prefix: 1, suffix: emptyCell().asSlice() };
        self.b = RemainStruct{ prefix: 2, suffix: emptyCell().asSlice() };
    }
}