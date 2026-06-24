struct BigOne {
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
    f12: Int = 12;
    f13: Int = 13;
    f14: Int = 14;
    f15: Int = 15;
    f16: Int = 16;
    f17: Int = 17;
    f18: Int = 18;
    f19: Int = 19;
    f20: Int = 20;
}

contract Test {
    data: BigOne = BigOne{};

    init() {
        self.data = BigOne{
            f1:101, f2:102, f3:103, f4:104, f5:105,
            f6:106, f7:107, f8:108, f9:109, f10:110,
            f11:111, f12:112, f13:113, f14:114, f15:115,
            f16:116, f17:117, f18:118, f19:119, f20:120
        };
    }
}