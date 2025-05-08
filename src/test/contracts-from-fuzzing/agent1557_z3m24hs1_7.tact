struct PrimitivesCombo {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract VariousPrimitiveFields {
    data: PrimitivesCombo;

    init() {
        self.data = PrimitivesCombo{
            i: 7, b: false, s: "test", c: emptyCell(), sl: emptyCell().asSlice(), a: myAddress()
        };
    }
}