struct S { x: Int; y: Bool; z: String; opt: Int?; }

contract Test {
    // Sequence of many repeated struct fields
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    s6: S;
    s7: S;
    s8: S;
    s9: S;
    s10: S;

    init() {
        let val = S{x:1,y:true,z:"z",opt:null};
        self.s1 = val;
        self.s2 = val;
        self.s3 = val;
        self.s4 = val;
        self.s5 = val;
        self.s6 = val;
        self.s7 = val;
        self.s8 = val;
        self.s9 = val;
        self.s10 = val;
    }
}