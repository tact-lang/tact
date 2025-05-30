struct SBig {
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

contract StructTwentyFields {
    s: SBig;

    init() {
        self.s = SBig{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,f20:20
        };
    }

    receive() {
        let sum = 
            self.s.f1+self.s.f2+self.s.f3+self.s.f4+self.s.f5+
            self.s.f6+self.s.f7+self.s.f8+self.s.f9+self.s.f10+
            self.s.f11+self.s.f12+self.s.f13+self.s.f14+self.s.f15+
            self.s.f16+self.s.f17+self.s.f18+self.s.f19+self.s.f20;
    }
}