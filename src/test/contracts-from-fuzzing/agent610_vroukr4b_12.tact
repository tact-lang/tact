struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract FillDefaults {
    s: S;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.s = S{ a:0, b:false, c:"" };
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}