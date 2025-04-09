contract LargeVars {
    x1: Int = 1;
    x2: Bool = false;
    x3: String = "a";
    x4: Int = 4;
    x5: Bool = true;
    x6: String = "b";
    x7: Int = 7;
    x8: Bool = true;
    x9: String = "c";
    x10: Int = 10;

    init() {
        self.x1 = 111;
        self.x2 = true;
        self.x3 = "changed";
        self.x4 = 44;
        self.x5 = false;
        self.x6 = "xx";
        self.x7 = 777;
        self.x8 = false;
        self.x9 = "yy";
        self.x10 = 1010;
    }
}