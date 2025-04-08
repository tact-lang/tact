contract LargePersistent {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    int7: Int;
    int8: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    str1: String;
    str2: String;
    opt1: Int?;
    opt2: String?;

    init() {
        self.int1 = 1; self.int2 = 2; self.int3 = 3; self.int4 = 4;
        self.int5 = 5; self.int6 = 6; self.int7 = 7; self.int8 = 8;
        self.bool1 = true; self.bool2 = false;
        self.bool3 = true; self.bool4 = false;
        self.str1 = "a"; self.str2 = "b";
        self.opt1 = null;
        self.opt2 = null;
    }
}