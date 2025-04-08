struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    adr: Address;
    opti: Int?;
    optb: Bool?;
    opts: String?;
    optc: Cell?;
    optsli: Slice?;
    optadr: Address?;
}

contract TestContract {
    mixed: Mixed;
    init() {
        self.mixed = Mixed{
            i: 1,
            b: true,
            s: "str",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            adr: myAddress(),
            opti: null,
            optb: null,
            opts: null,
            optc: null,
            optsli: null,
            optadr: null
        };
    }
}