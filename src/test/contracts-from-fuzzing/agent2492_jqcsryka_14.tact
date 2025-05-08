struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }
struct S4 { d: Int }
struct S5 { e: Int }

contract LotsOfStructs {
    sa: S1;
    sb: S2;
    sc: S3;
    sd: S4;
    se: S5;

    init() {
        self.sa = S1{a:1};
        self.sb = S2{b:2};
        self.sc = S3{c:3};
        self.sd = S4{d:4};
        self.se = S5{e:5};
    }
}