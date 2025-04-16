contract MixingSerializations {
    i: Int as uint8;
    j: Int as int64;
    s: String;
    optStr: String?;
    b: Bool;
    optBool: Bool?;

    init() {
        self.i = 1;
        self.j = 2;
        self.s = "hello";
        self.optStr = null;
        self.b = false;
        self.optBool = true;
    }
}
