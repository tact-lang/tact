struct ManyPrimitives {
    num: Int;
    flag: Bool;
    addr: Address;
    cellref: Cell;
    slice: Slice;
    builder: Builder;
    str: String;
}

contract PrimFields {
    fields: ManyPrimitives;

    init() {
        self.fields = ManyPrimitives{
            num: 1,
            flag: true,
            addr: myAddress(),
            cellref: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
            str: "hello",
        };
    }
}