struct StructMany {
    s1: Int;
    s2: Int;
    s3: Int;
    s4: Int;
    s5: Int;
    s6: Int;
    s7: Int;
    s8: Int;
    s9: Int;
    s10: Int;
    s11: Int;
    s12: Int;
    s13: Int;
    s14: Int;
    s15: Int;
}

contract BigStructTest {
    s: StructMany;

    init() {
        self.s = StructMany{
            s1:1,s2:2,s3:3,s4:4,s5:5,s6:6,s7:7,s8:8,s9:9,s10:10,s11:11,s12:12,s13:13,s14:14,s15:15
        };
    }
}