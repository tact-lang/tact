// Contract with large variety and alternation of optional and non-optional primitive fields
contract MixPrimOpt {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
    g: Bool;
    h: String?;
    i: Address;
    j: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "abc";
        self.d = null;
        self.e = emptyCell();
        self.f = null;
        self.g = true;
        self.h = null;
        self.i = myAddress();
        self.j = null;
    }
}
