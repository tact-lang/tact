struct TestRemain {
    fld: Int as uint32;
    rest: Slice as remaining;
}

contract HasRemainStruct {
    data: TestRemain;

    init() {
        self.data = TestRemain{
            fld: 42,
            rest: emptyCell().asSlice(),
        };
    }
}