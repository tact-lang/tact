contract ManyPrimitiveFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    bool5: Bool;
    str1: String;
    str2: String;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.bool1 = true;
        self.bool2 = false;
        self.bool3 = true;
        self.bool4 = false;
        self.bool5 = true;
        self.str1 = "hello";
        self.str2 = "world";
    }
}