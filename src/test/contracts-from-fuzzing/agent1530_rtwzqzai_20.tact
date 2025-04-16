contract TestContract {
    int1: Int; int2: Int; int3: Int;
    bool1: Bool; bool2: Bool;
    str1: String; str2: String;
    opt1: Int?; opt2: String?; opt3: Bool?;

    init() {
        self.int1 = 1; self.int2 = 2; self.int3 = 3;
        self.bool1 = true; self.bool2 = false;
        self.str1 = "x"; self.str2 = "y";
        self.opt1 = null; self.opt2 = null; self.opt3 = null;
    }
}
