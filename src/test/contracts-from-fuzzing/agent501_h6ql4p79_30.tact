struct S {
    i: Int;
    b: Bool;
}

contract ManyStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    s6: S;
    s7: S;
    s8: S;

    init() {
        self.s1 = S{ i: 1, b:true };
        self.s2 = S{ i: 2, b:false };
        self.s3 = S{ i: 3, b:true };
        self.s4 = S{ i: 4, b:false };
        self.s5 = S{ i: 5, b:true };
        self.s6 = S{ i: 6, b:false };
        self.s7 = S{ i: 7, b:true };
        self.s8 = S{ i: 8, b:false };
    }
}