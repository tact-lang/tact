struct SliceStruct {
    s: Slice;
}

contract SliceFieldTest {
    f: SliceStruct;

    init() {
        self.f = SliceStruct{s: emptyCell().asSlice()};
    }
}