struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract TwoStructs {
    sa: S1;
    sb: S2;

    init() {
        self.sa = S1{a:11};
        self.sb = S2{b:22};
    }
}
