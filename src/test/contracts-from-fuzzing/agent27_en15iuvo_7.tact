contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optAddr: Address?;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "hi";
        self.addr = myAddress();
        self.optI = null;
        self.optB = null;
        self.optS = null;
        self.optAddr = null;
    }
}