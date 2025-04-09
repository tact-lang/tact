struct LargeNumberStruct {
    int0: Int;
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    int7: Int;
    int8: Int;
    int9: Int;
    int10: Int;
    int11: Int;
    int12: Int;
    int13: Int;
    int14: Int;
    int15: Int;
    int16: Int;
    int17: Int;
    int18: Int;
    int19: Int;
}

contract Test {
    big: LargeNumberStruct;

    init() {
        self.big = LargeNumberStruct{
            int0: 0, int1:1, int2:2, int3:3, int4:4,
            int5:5, int6:6, int7:7, int8:8, int9:9,
            int10:10, int11:11, int12:12, int13:13, int14:14,
            int15:15, int16:16, int17:17, int18:18, int19:19
        };
    }
}
