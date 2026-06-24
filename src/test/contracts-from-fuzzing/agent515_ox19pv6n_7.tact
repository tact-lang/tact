contract LongVars {
    a1: Int = 1;
    a2: Int;
    a3: Bool = true;
    a4: Bool;
    a5: String = "x";
    a6: String;
    a7: Address;
    a8: Int;
    a9: Int = 999;
    a10: Int;
    a11: Bool = false;
    a12: Bool;
    a13: String = "z";
    a14: String;
    a15: Int = -42;
    a16: Int;
    a17: Bool = true;
    a18: Bool;
    a19: String = "yyy";
    a20: String;

    init() {
        self.a2 = 2;
        self.a4 = false;
        self.a6 = "a";
        self.a7 = myAddress();
        self.a8 = 8;
        self.a10 = 10;
        self.a12 = true;
        self.a14 = "b";
        self.a16 = 16;
        self.a18 = false;
        self.a20 = "c";
    }

    receive() {}
}