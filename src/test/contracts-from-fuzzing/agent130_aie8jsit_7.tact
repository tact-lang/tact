struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    optInt: Int?;
    optStr: String?;
    optSlice: Slice?;
}

contract Extended {
    f: Complex;

    init() {
        self.f = Complex {
            i: -7,
            b: false,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            optInt: null,
            optStr: null,
            optSlice: null
        };
    }
}