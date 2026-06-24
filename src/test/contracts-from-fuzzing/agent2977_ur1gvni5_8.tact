struct PrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract PrimitiveMix {
    p: PrimitiveFields;

    init() {
        self.p = PrimitiveFields{
            i: 1, b: true, s: "hi", c: emptyCell(), sl: emptyCell().asSlice(), a: myAddress()
        };
    }
}