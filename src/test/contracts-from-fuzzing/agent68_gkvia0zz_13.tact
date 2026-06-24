struct Small {
    a: Int;
    b: Bool;
    c: String;
}

contract ManySmallObjs {
    s1: Small;
    s2: Small;
    s3: Small;
    s4: Small;
    s5: Small;
    s6: Small;
    s7: Small;
    s8: Small;
    s9: Small;
    s10: Small;

    init() {
        self.s1 = Small{a:1,b:true,c:"x1"};
        self.s2 = Small{a:2,b:false,c:"x2"};
        self.s3 = Small{a:3,b:true,c:"x3"};
        self.s4 = Small{a:4,b:false,c:"x4"};
        self.s5 = Small{a:5,b:true,c:"x5"};
        self.s6 = Small{a:6,b:false,c:"x6"};
        self.s7 = Small{a:7,b:true,c:"x7"};
        self.s8 = Small{a:8,b:false,c:"x8"};
        self.s9 = Small{a:9,b:true,c:"x9"};
        self.s10= Small{a:10,b:false,c:"x10"};
    }
}