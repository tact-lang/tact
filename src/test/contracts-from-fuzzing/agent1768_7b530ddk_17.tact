struct Combo {
    i: Int;
    bi: Bool;
    si: String;
    sl: Slice;
    addr: Address;
    ci: Cell;
    oi: Int?;
    ob: Bool?;
    os: String?;
    osl: Slice?;
    oa: Address?;
    oc: Cell?;
}

contract TestStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            i: 1,
            bi: false,
            si: "x",
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            ci: emptyCell(),
            oi: null,
            ob: null,
            os: null,
            osl: null,
            oa: null,
            oc: null
        };
    }
}