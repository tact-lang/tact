// Edge case: many contract fields with no default init, initialized in `init()`
contract ManyFieldsNoDefaults {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: String?;
    i: Address?;

    init() {
        self.a = 10;
        self.b = "foo";
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
    }
}