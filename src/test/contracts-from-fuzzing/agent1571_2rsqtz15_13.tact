struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    opti: Int?;
    optb: Bool?;
    opts: String?;
    optc: Cell?;
    optslice: Slice?;
}

contract Test13 {
    info: Mixed;
    init() {
        self.info = Mixed{
            i: 7,
            b: false,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            opti: null,
            optb: null,
            opts: null,
            optc: null,
            optslice: null
        };
    }
}
