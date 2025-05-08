struct Mixed {
    i: Int;
    s: String;
    b: Bool;
    a: Address;
    c: Cell;
    oi: Int?;
    os: String?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
}

contract Test {
    mixed: Mixed;
    init() {
        self.mixed = Mixed{
            i: 1, s: "x", b: true, a: myAddress(), c: emptyCell(),
            oi: null, os: null, ob: null, oa: null, oc: null
        };
    }
}