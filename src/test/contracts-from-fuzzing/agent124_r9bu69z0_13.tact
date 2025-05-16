contract ManyFieldsTypes {
    n: Int;
    s: String;
    b: Bool;
    addr: Address;
    cl: Cell;
    sl: Slice;
    opInt: Int?;
    opStr: String?;
    opBool: Bool?;

    init() {
        self.n = 1;
        self.s = "hi";
        self.b = false;
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = self.cl.asSlice();
        self.opInt = null;
        self.opStr = null;
        self.opBool = null;
    }
}