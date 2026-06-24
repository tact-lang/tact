struct S { i1: Int; i2: Int; }

contract SeqStructInit {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{i1:1,i2:2};
        self.s2 = S{i1:3,i2:4};
    }
}
