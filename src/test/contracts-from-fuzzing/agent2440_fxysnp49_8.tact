struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }
struct S4 { d: Int; }
struct S5 { e: Int; }
struct S6 { f: Int; }
struct S7 { g: Int; }
struct S8 { h: Int; }
struct S9 { i: Int; }
struct S10 { j: Int; }

contract LargeStructArray {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;
    s7: S7;
    s8: S8;
    s9: S9;
    s10: S10;

    init() {
        self.s1 = S1{a:1};
        self.s2 = S2{b:2};
        self.s3 = S3{c:3};
        self.s4 = S4{d:4};
        self.s5 = S5{e:5};
        self.s6 = S6{f:6};
        self.s7 = S7{g:7};
        self.s8 = S8{h:8};
        self.s9 = S9{i:9};
        self.s10 = S10{j:10};
    }
}
