struct S1 { f: Int; }
struct S2 { g: Int; }
struct S3 { h: Int; }
struct S4 { i: Int; }
struct S5 { j: Int; }
struct S6 { k: Int; }
struct S7 { l: Int; }
struct S8 { m: Int; }
struct S9 { n: Int; }
struct S10 { o: Int; }

contract ManyNested {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;
    f: S6;
    g: S7;
    h: S8;
    i: S9;
    j: S10;

    init() {
        self.a = S1{f:1};
        self.b = S2{g:2};
        self.c = S3{h:3};
        self.d = S4{i:4};
        self.e = S5{j:5};
        self.f = S6{k:6};
        self.g = S7{l:7};
        self.h = S8{m:8};
        self.i = S9{n:9};
        self.j = S10{o:10};
    }
}