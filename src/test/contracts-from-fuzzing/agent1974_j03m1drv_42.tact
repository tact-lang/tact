struct Struc {
    val: Int;
    flag: Bool;
}

contract ManySimpleFields {
    s1: Struc;
    s2: Struc;
    s3: Struc;
    s4: Struc;
    s5: Struc;
    s6: Struc;
    s7: Struc;

    init() {
        self.s1 = Struc{ val:1, flag:true };
        self.s2 = Struc{ val:2, flag:false };
        self.s3 = Struc{ val:3, flag:true };
        self.s4 = Struc{ val:4, flag:false };
        self.s5 = Struc{ val:5, flag:true };
        self.s6 = Struc{ val:6, flag:false };
        self.s7 = Struc{ val:7, flag:true };
    }
}
