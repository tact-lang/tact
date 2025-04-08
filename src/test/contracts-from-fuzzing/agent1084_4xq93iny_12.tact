contract MixedTypesLongList {
    int1: Int;
    bool1: Bool;
    str1: String;
    int2: Int?;
    bool2: Bool?;
    str2: String?;
    int3: Int;
    bool3: Bool;
    str3: String;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.str1 = "one";
        self.int2 = null;
        self.bool2 = null;
        self.str2 = null;
        self.int3 = 2;
        self.bool3 = false;
        self.str3 = "two";
    }
}