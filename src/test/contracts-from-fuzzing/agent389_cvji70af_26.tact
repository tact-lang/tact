struct HasSliceRem {
    prefix: Int;
    rest: Slice as remaining;
}

contract RemainDemo {
    f: HasSliceRem;

    init() {
        self.f = HasSliceRem{
            prefix: 1,
            rest: emptyCell().asSlice()
        };
    }
}