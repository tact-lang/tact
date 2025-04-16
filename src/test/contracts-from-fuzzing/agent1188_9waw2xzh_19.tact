struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct S3 {
    c: Int;
}

contract WideMultipleStructs {
    sa: S1;
    sb: S2;
    sc: S3;

    init() {
        self.sa = S1{a:1};
        self.sb = S2{b:2};
        self.sc = S3{c:3};
    }
}