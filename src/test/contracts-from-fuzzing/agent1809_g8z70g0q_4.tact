struct ComplexTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;
}

contract ManyPrimitiveFields {
    x: ComplexTypes;

    init() {
        self.x = ComplexTypes{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell()
        };
    }
}