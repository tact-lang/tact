contract BoolIntStrings {
    b: Bool;
    i: Int;
    s: String;
    optB: Bool?;
    optI: Int?;
    optS: String?;
    init() {
        self.b = true;
        self.i = 123;
        self.s = "test";
        self.optB = null;
        self.optI = null;
        self.optS = "hello";
    }
}