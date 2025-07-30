struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }
struct S4 { d: Int; }
struct S5 { e: Int; }

contract ManyNested {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;

    init() {
        self.f1 = S1{ a: 1 };
        self.f2 = S2{ b: 2 };
        self.f3 = S3{ c: 3 };
        self.f4 = S4{ d: 4 };
        self.f5 = S5{ e: 5 };
    }
}