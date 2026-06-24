struct RemainPart { leftover: Slice as remaining; }

contract RemainStruct {
    test: RemainPart;
    init() {
        self.test = RemainPart{ leftover: emptyCell().asSlice() };
    }
}