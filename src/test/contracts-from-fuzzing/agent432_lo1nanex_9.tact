struct S1 { x: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }
struct S5 { s4: S4; }
struct S6 { s5: S5; }
struct S7 { s6: S6; }
struct S8 { s7: S7; }

contract ChainStorage {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;
    f: S6;
    g: S7;
    h: S8;

    init() {
        self.a = S1{ x: 1 };
        self.b = S2{ s1: self.a };
        self.c = S3{ s2: self.b };
        self.d = S4{ s3: self.c };
        self.e = S5{ s4: self.d };
        self.f = S6{ s5: self.e };
        self.g = S7{ s6: self.f };
        self.h = S8{ s7: self.g };
    }
}
