// Large contract with all primitive types and optionals
contract AllTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;

    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: Slice?;
    ostr: String?;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.str = "str";
        self.oi = null;
        self.ob = null;
        self.oa = null;
        self.oc = null;
        self.os = null;
        self.ostr = null;
    }
}