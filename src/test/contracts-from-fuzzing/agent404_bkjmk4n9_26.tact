struct S0 { a: Int; }
struct S1 { b: Int; }
struct S2 { c: Int; }
struct S3 { d: Int; }
struct S4 { e: Int; }
struct S5 { f: Int; }

contract ManyNestedStructs {
    s0: S0;
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    init() {
        self.s0 = S0{a:0};
        self.s1 = S1{b:1};
        self.s2 = S2{c:2};
        self.s3 = S3{d:3};
        self.s4 = S4{e:4};
        self.s5 = S5{f:5};
    }
}