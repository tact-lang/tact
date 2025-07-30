struct Sub {
    val: Int;
}

contract MixedFlat {
    i: Int;
    b: Bool;
    s: String;
    sub: Sub;
    optStr: String?;
    optBool: Bool?;
    addr: Address;
    optInt: Int?;
    init() {
        self.i = 1;
        self.b = true;
        self.s = "hi";
        self.sub = Sub{val: 7};
        self.optStr = null;
        self.optBool = null;
        self.addr = myAddress();
        self.optInt = null;
    }
}