struct StringAndComplex {
    s: String;
    addr: Address;
    c: Cell;
    slice: Slice;
    builder: Builder;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
}

contract ComplexStructHolder {
    obj: StringAndComplex;

    init() {
        self.obj = StringAndComplex{
            s: "hi",
            addr: myAddress(),
            c: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
            optStr: null,
            optAddr: null,
            optCell: null
        };
    }
}