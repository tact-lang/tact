struct Rec {
    a: Int;
    b: Bool;
}

contract LargeFlat {
    r1: Rec;
    r2: Rec;
    r3: Rec;
    r4: Rec;
    r5: Rec;
    r6: Rec;
    r7: Rec;
    r8: Rec;
    r9: Rec;
    r10: Rec;
    r11: Rec;
    r12: Rec;
    r13: Rec;
    r14: Rec;
    r15: Rec;

    init() {
        self.r1 = Rec{a:1,b:true};
        self.r2 = Rec{a:2,b:false};
        self.r3 = Rec{a:3,b:true};
        self.r4 = Rec{a:4,b:false};
        self.r5 = Rec{a:5,b:true};
        self.r6 = Rec{a:6,b:false};
        self.r7 = Rec{a:7,b:true};
        self.r8 = Rec{a:8,b:false};
        self.r9 = Rec{a:9,b:true};
        self.r10 = Rec{a:10,b:false};
        self.r11 = Rec{a:11,b:true};
        self.r12 = Rec{a:12,b:false};
        self.r13 = Rec{a:13,b:true};
        self.r14 = Rec{a:14,b:false};
        self.r15 = Rec{a:15,b:true};
    }
}