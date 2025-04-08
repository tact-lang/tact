contract ManyPrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    iOpt: Int?;
    bOpt: Bool?;
    sOpt: String?;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "hi";
        self.iOpt = null;
        self.bOpt = false;
        self.sOpt = null;
    }
}
