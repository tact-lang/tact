struct LargeStruct {
    f01: Int;  f02: Int;  f03: Int;  f04: Int;  f05: Int;
    f06: Int;  f07: Int;  f08: Int;  f09: Int;  f10: Int;
    f11: Int;  f12: Int;  f13: Int;  f14: Int;  f15: Int;
    f16: Int;  f17: Int;  f18: Int;  f19: Int;  f20: Int;
}

contract ManyFields {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f01:1,f02:2,f03:3,f04:4,f05:5,
            f06:6,f07:7,f08:8,f09:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,
            f16:16,f17:17,f18:18,f19:19,f20:20
        };
    }
}