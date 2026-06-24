struct Combo {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    sl: Slice;
    c: Cell;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    osl: Slice?;
    oc: Cell?;
}

contract ManyCombos {
    combo: Combo;

    init() {
        self.combo = Combo{
            i: 1,
            b: true,
            s: "abc",
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            c: emptyCell(),
            oi: null,
            ob: null,
            os: null,
            oa: null,
            osl: null,
            oc: null,
        };
    }
}
