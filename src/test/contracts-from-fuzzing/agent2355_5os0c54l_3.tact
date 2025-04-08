contract ManyTypes {
    i: Int = 1;
    b: Bool = true;
    a: Address; // init
    c: Cell; // init
    s: Slice; // init
    str: String = "hello";
    optInt: Int? = null;
    optBool: Bool? = null;
    optAddr: Address? = null;
    optCell: Cell? = null;
    optSlice: Slice? = null;
    optStr: String? = null;

    init() {
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
    }
}