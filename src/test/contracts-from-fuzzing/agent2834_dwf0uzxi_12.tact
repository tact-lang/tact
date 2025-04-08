contract WidePrimitives {
    int1: Int;
    bool1: Bool;
    string1: String;
    intOpt: Int?;
    bool2: Bool;
    string2: String;
    int2: Int;
    boolOpt: Bool?;
    stringOpt: String?;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.string1 = "a";
        self.intOpt = null;
        self.bool2 = false;
        self.string2 = "b";
        self.int2 = 2;
        self.boolOpt = null;
        self.stringOpt = null;
    }
}