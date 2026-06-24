struct Inner { val: Int; }
contract Test1 {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sb: Slice;
    inn: Inner;
    optInt: Int?;
    optBool: Bool?;
    optSlice: Slice?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "abc";
        self.c = emptyCell();
        self.a = myAddress();
        self.sb = emptyCell().asSlice();
        self.inn = Inner{val: 42};
        self.optInt = null;
        self.optBool = null;
        self.optSlice = null;
    }
}
