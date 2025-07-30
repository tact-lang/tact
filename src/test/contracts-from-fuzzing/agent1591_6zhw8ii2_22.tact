struct S {
    i: Int;
}

contract FixedArrayMimic {
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
        self.s1 = S{i:1};
        self.s2 = S{i:2};
        self.s3 = S{i:3};
        self.s4 = S{i:4};
        self.s5 = S{i:5};
        self.s6 = S{i:6};
        self.s7 = S{i:7};
        self.s8 = S{i:8};
        self.s9 = S{i:9};
        self.s10 = S{i:10};
    }

    receive() {
        self.s1 = self.s1;
    }
}