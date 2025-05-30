struct LargeStruct {
    p1: Int;
    p2: Int;
    p3: Int;
    p4: Int;
    p5: Int;
    p6: Int;
    p7: Int;
    p8: Int;
    p9: Int;
    p10: Int;
    p11: Int;
    p12: Int;
    p13: Int;
    p14: Int;
    p15: Int;
    p16: Int;
    p17: Int;
    p18: Int;
    p19: Int;
    p20: Int;
}

contract HasLargeStruct {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            p1:1,p2:2,p3:3,p4:4,p5:5,p6:6,p7:7,p8:8,p9:9,p10:10,
            p11:11,p12:12,p13:13,p14:14,p15:15,p16:16,p17:17,p18:18,p19:19,p20:20
        };
    }
}