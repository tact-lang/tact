struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }
struct S4 { d: Int }
struct S5 { e: Int }
struct S6 { f: Int }

contract MultiStructs {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;

    init() {
        self.s1 = S1{a:1};
        self.s2 = S2{b:2};
        self.s3 = S3{c:3};
        self.s4 = S4{d:4};
        self.s5 = S5{e:5};
        self.s6 = S6{f:6};
    }

    receive() {
        let s = self.s1.a + self.s2.b + self.s3.c + self.s4.d + self.s5.e + self.s6.f;
    }
}