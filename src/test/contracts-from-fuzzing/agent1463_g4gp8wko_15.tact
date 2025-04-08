struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { a: Int; }
struct S4 { a: Int; }
struct S5 { a: Int; }

contract StructMix {
    f1: S1;
    f2: S2?;
    f3: S3;
    f4: S4?;
    f5: S5;

    init() {
        self.f1 = S1{a: 1};
        self.f2 = null;
        self.f3 = S3{a: 3};
        self.f4 = null;
        self.f5 = S5{a: 5};
    }
}
