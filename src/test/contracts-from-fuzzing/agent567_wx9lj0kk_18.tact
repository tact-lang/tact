// very wide struct with many fields of same type
struct Wide {
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
}

contract WideContract {
    big: Wide;
    init() {
        self.big = Wide{
            f1:11,f2:12,f3:13,f4:14,f5:15,f6:16,
            f7:17,f8:18,f9:19,f10:20,f11:21,f12:22,
            f13:23,f14:24,f15:25,f16:26,
        };
    }
}
