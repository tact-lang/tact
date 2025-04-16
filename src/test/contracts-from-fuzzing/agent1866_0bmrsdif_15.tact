contract MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "x";
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
    }
}