struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }
struct S4 { d: Int; }
struct S5 { e: Int; }
struct S6 { f: Int; }
struct S7 { g: Int; }
struct S8 { h: Int; }
struct S9 { i: Int; }

contract TestContract {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;
    f6: S6;
    f7: S7;
    f8: S8;
    f9: S9;

    init() {
        self.f1 = S1{a:1};
        self.f2 = S2{b:2};
        self.f3 = S3{c:3};
        self.f4 = S4{d:4};
        self.f5 = S5{e:5};
        self.f6 = S6{f:6};
        self.f7 = S7{g:7};
        self.f8 = S8{h:8};
        self.f9 = S9{i:9};
    }
}