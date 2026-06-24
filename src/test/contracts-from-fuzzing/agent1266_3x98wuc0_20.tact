struct NestedRemSlice {
    field1: Int;
    rest: Slice as remaining;
}

contract RemSliceCont {
    test: NestedRemSlice;
    init() {
        self.test = NestedRemSlice {
            field1: 7,
            rest: emptyCell().asSlice(),
        };
    }
}