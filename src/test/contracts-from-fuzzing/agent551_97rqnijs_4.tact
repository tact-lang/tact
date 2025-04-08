contract TestContract {
    int1: Int;
    int2: Int as uint32;
    bool1: Bool;
    bool2: Bool = true;
    optInt: Int?;
    str1: String;
    optStr: String?;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = false;
        self.optInt = null;
        self.str1 = "hello";
        self.optStr = "world";
    }
}