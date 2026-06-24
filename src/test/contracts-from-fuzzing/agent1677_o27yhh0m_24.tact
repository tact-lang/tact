contract MixTypes {
    i: Int;
    b: Bool;
    addr: Address;
    s: String;
    optInt: Int?;
    optStr: String?;

    init() {
        self.i = 1;
        self.b = true;
        self.addr = myAddress();
        self.s = "test";
        self.optInt = null;
        self.optStr = null;
    }
}