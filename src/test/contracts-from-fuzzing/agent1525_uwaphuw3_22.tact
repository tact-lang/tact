struct ComplexPrim {
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
}

contract ComplexPrimTypes {
    f: ComplexPrim;

    init() {
        self.f = ComplexPrim{
            s: "escaped \\t tab and \\n newline",
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice(),
        };
    }
}