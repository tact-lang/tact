struct LargeStruct {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
}

contract LargeTest {
    data: LargeStruct = LargeStruct{
        f1:1, f2:2, f3:3, f4:4, f5:5,
        f6:6, f7:7, f8:8, f9:9, f10:10,
        f11:11, f12:12, f13:13, f14:14, f15:15
    };

    init() {
        self.data = LargeStruct{
            f1:101, f2:102, f3:103, f4:104, f5:105,
            f6:106, f7:107, f8:108, f9:109, f10:110,
            f11:111, f12:112, f13:113, f14:114, f15:115
        };
    }
}
