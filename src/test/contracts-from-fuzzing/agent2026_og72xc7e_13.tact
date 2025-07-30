contract TestContract {
    str1: String;
    int1: Int;
    optStr: String?;
    optInt: Int?;
    bool1: Bool;
    bool2: Bool;

    init() {
        self.str1 = "hi";
        self.int1 = 123;
        self.optStr = null;
        self.optInt = null;
        self.bool1 = true;
        self.bool2 = false;
    }
}