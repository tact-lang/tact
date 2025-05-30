contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address? = null;
    d: Cell; // no default value
    e: Slice; // no default value
    f: String = "test";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.a = 10;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "changed";
        self.optInt = 123;
        self.optBool = true;
        self.optStr = "zzz";
    }

    receive() {
        dump(self.optStr);
    }
}