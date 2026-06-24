struct X1 { f: Int; }
struct X2 { f: Int; }
struct X3 { f: Int; }
struct X4 { f: Int; }
struct X5 { f: Int; }
struct X6 { f: Int; }
struct X7 { f: Int; }
struct X8 { f: Int; }

contract ManyStructs {
    a: X1;
    b: X2;
    c: X3;
    d: X4;
    e: X5;
    f: X6;
    g: X7;
    h: X8;

    init() {
        self.a = X1{f:1};
        self.b = X2{f:2};
        self.c = X3{f:3};
        self.d = X4{f:4};
        self.e = X5{f:5};
        self.f = X6{f:6};
        self.g = X7{f:7};
        self.h = X8{f:8};
    }
}