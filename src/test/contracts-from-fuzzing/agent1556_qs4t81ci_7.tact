// very long contract field list
contract TestContract {
    a0: Int = 0;
    a1: Int = 1;
    a2: Int = 2;
    a3: Int = 3;
    a4: Int = 4;
    a5: Int = 5;
    a6: Int = 6;
    a7: Int = 7;
    a8: Int = 8;
    a9: Int = 9;
    a10: Int = 10;
    a11: Int = 11;
    a12: Int = 12;
    a13: Int = 13;
    a14: Int = 14;
    a15: Int = 15;
    a16: Int = 16;
    a17: Int = 17;
    a18: Int = 18;
    a19: Int = 19;

    init() {
        self.a0 = 100;
        self.a19 = 200;
    }

    receive() {
        let _ = self.a0 + self.a1 + self.a2 + self.a3 + self.a4 + self.a5 + self.a6 + self.a7 + self.a8 + self.a9 + self.a10 + self.a11 + self.a12 + self.a13 + self.a14 + self.a15 + self.a16 + self.a17 + self.a18 + self.a19;
    }
}