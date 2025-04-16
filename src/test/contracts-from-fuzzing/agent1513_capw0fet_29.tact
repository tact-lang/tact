struct S {
    x: Int;
}
contract ArrTest {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    s6: S;
    s7: S;
    
    init() {
        self.s1 = S{ x:1 };
        self.s2 = S{ x:2 };
        self.s3 = S{ x:3 };
        self.s4 = S{ x:4 };
        self.s5 = S{ x:5 };
        self.s6 = S{ x:6 };
        self.s7 = S{ x:7 };
    }
}