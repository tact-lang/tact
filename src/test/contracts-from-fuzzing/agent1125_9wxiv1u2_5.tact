struct S1 { f1: Int }
struct S2 { f2: Int }
struct S3 { f3: Int }
struct S4 { f4: Int }
struct S5 { f5: Int }
struct S6 { f6: Int }
struct S7 { f7: Int }
struct S8 { f8: Int }
struct S9 { f9: Int }

contract WideNested {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;
    f: S6;
    g: S7;
    h: S8;
    i: S9;

    init() {
        self.a = S1{ f1: 1 };
        self.b = S2{ f2: 2 };
        self.c = S3{ f3: 3 };
        self.d = S4{ f4: 4 };
        self.e = S5{ f5: 5 };
        self.f = S6{ f6: 6 };
        self.g = S7{ f7: 7 };
        self.h = S8{ f8: 8 };
        self.i = S9{ f9: 9 };
    }
}