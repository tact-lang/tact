struct LongStruct {
    i01: Int;
    i02: Int;
    i03: Int;
    i04: Int;
    i05: Int;
    i06: Int;
    i07: Int;
    i08: Int;
    i09: Int;
    i10: Int;
    i11: Int;
    i12: Int;
    i13: Int;
    i14: Int;
    i15: Int;
    i16: Int;
    i17: Int;
    i18: Int;
    i19: Int;
    i20: Int;
}

contract ManyFields {
    f: LongStruct;

    init() {
        self.f = LongStruct{
            i01:1,i02:2,i03:3,i04:4,i05:5,i06:6,i07:7,i08:8,i09:9,i10:10,
            i11:11,i12:12,i13:13,i14:14,i15:15,i16:16,i17:17,i18:18,i19:19,i20:20
        };
    }
}