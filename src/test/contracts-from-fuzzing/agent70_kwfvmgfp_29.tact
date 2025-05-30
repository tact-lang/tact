struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
}

contract BigPersistent {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,
            f16:16,f17:17,f18:18,f19:19,f20:20
        };
    }

    receive() {
        self.big = BigStruct{
            f1:11,f2:12,f3:13,f4:14,f5:15,
            f6:16,f7:17,f8:18,f9:19,f10:20,
            f11:21,f12:22,f13:23,f14:24,f15:25,
            f16:26,f17:27,f18:28,f19:29,f20:30
        };
    }
}