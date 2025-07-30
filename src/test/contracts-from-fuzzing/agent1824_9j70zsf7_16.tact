struct S {
    a: Int;
    b: Bool;
}

contract LargeArrayFields {
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    f5: S;
    f6: S;
    f7: S;
    f8: S;
    f9: S;
    f10: S;
    f11: S;
    f12: S;
    f13: S;
    f14: S;
    f15: S;
    f16: S;
    f17: S;
    f18: S;
    f19: S;
    f20: S;

    init() {
        self.f1 = S{a:1,b:true};
        self.f2 = S{a:2,b:false};
        self.f3 = S{a:3,b:true};
        self.f4 = S{a:4,b:false};
        self.f5 = S{a:5,b:true};
        self.f6 = S{a:6,b:false};
        self.f7 = S{a:7,b:true};
        self.f8 = S{a:8,b:false};
        self.f9 = S{a:9,b:true};
        self.f10 = S{a:10,b:false};
        self.f11 = S{a:11,b:true};
        self.f12 = S{a:12,b:false};
        self.f13 = S{a:13,b:true};
        self.f14 = S{a:14,b:false};
        self.f15 = S{a:15,b:true};
        self.f16 = S{a:16,b:false};
        self.f17 = S{a:17,b:true};
        self.f18 = S{a:18,b:false};
        self.f19 = S{a:19,b:true};
        self.f20 = S{a:20,b:false};
    }
}
