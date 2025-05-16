struct Complex {
    i: Int as int64;
    u: Int as uint64;
    s: String;
    c: Cell;
    sl: Slice;
    b: Bool;
    o: Int?;
}

contract ComplexPersist {
    comp: Complex;

    init() {
        self.comp = Complex{
            i: -5,
            u: 5,
            s: "abc",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            b: false,
            o: null
        };
    }
}
