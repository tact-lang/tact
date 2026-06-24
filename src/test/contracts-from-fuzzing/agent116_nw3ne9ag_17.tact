contract OptionalsSliceCell {
    data: Data;

    init() {
        self.data = Data{
            a: null,
            b: emptyCell(),
            c: emptyCell().asSlice(),
            d: null,
            e: 123
        };
    }
}

struct Data {
    a: Cell?;
    b: Cell;
    c: Slice;
    d: Slice?;
    e: Int;
}
