struct HasSliceRem {
    a: Int;
    rest: Slice as remaining;
}

contract SliceRemain {
    rec: HasSliceRem;

    init() {
        self.rec = HasSliceRem{a: 777, rest: emptyCell().asSlice()};
    }
}