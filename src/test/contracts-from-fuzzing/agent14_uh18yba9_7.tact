contract LargeFlatStorage {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
    a11: Bool;
    a12: Bool;
    a13: Bool;
    a14: Bool;
    a15: Bool;
    a16: Address;
    a17: Address;
    a18: Address;
    a19: Address;

    init() {
        self.a0 = 0;
        self.a1 = 1;
        self.a2 = 2;
        self.a3 = 3;
        self.a4 = 4;
        self.a5 = 5;
        self.a6 = 6;
        self.a7 = 7;
        self.a8 = 8;
        self.a9 = 9;
        self.a10 = 10;
        self.a11 = true;
        self.a12 = false;
        self.a13 = true;
        self.a14 = false;
        self.a15 = true;
        self.a16 = myAddress();
        self.a17 = myAddress();
        self.a18 = myAddress();
        self.a19 = myAddress();
    }
}