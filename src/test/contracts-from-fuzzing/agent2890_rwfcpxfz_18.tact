struct LargeDefaults {
    f0: Int = 0;
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Int = 6;
    f7: Int = 7;
    f8: Int = 8;
    f9: Int = 9;
    f10: Int = 10;
    f11: Int = 11;
}

contract ManyDefaults {
    s: LargeDefaults;

    init() {
        self.s = LargeDefaults{};
    }
}