contract LargeMultiType {
    int1: Int;
    bool1: Bool;
    str1: String;
    int2: Int?;
    bool2: Bool?;
    str2: String?;

    init() {
        self.int1 = 10;
        self.bool1 = true;
        self.str1 = "hello";
        self.int2 = null;
        self.bool2 = null;
        self.str2 = null;
    }
}
