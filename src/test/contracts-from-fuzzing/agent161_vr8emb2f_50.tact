// Large contract mixing all types repeatedly
contract LargeMixed {
    int1: Int;
    bool1: Bool;
    str1: String;
    optint1: Int?;
    optbool1: Bool?;
    optstr1: String?;
    int2: Int;
    bool2: Bool;
    str2: String;
    optint2: Int?;
    optbool2: Bool?;
    optstr2: String?;
    int3: Int;
    bool3: Bool;
    str3: String;
    optint3: Int?;
    optbool3: Bool?;
    optstr3: String?;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.str1 = "s1";
        self.optint1 = null;
        self.optbool1 = null;
        self.optstr1 = null;

        self.int2 = 2;
        self.bool2 = false;
        self.str2 = "s2";
        self.optint2 = null;
        self.optbool2 = null;
        self.optstr2 = null;

        self.int3 = 3;
        self.bool3 = true;
        self.str3 = "s3";
        self.optint3 = null;
        self.optbool3 = null;
        self.optstr3 = null;
    }
}
