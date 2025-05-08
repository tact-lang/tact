struct IntsAndSlice {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    sl: Slice;
}

contract IntSliceCombo {
    data: IntsAndSlice;

    init() {
        self.data = IntsAndSlice{
            a: 10,
            b: 20,
            c: -30,
            d: 40,
            sl: emptyCell().asSlice(),
        };
    }
}