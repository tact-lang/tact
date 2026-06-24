contract LargePrimitives {
    int1: Int;
    int2: Int as int64;
    int3: Int as uint8;
    int4: Int as uint32;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "one";
        self.str2 = "two";
    }
}