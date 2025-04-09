struct S {
    f1: Int;
    f2: Int;
}

contract ManyStructs {
    s0: S;
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    
    init() {
        self.s0 = S{f1: 1, f2: 2};
        self.s1 = S{f1: 3, f2: 4};
        self.s2 = S{f1: 5, f2: 6};
        self.s3 = S{f1: 7, f2: 8};
        self.s4 = S{f1: 9, f2: 10};
    }
}