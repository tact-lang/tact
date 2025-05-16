struct S1 { x: Int; }
struct S2 { x: Int; }
struct S3 { x: Int; }
struct S4 { x: Int; }
struct S5 { x: Int; }

contract ParallelStructs {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;

    init() {
        self.f1 = S1{ x: 1 };
        self.f2 = S2{ x: 2 };
        self.f3 = S3{ x: 3 };
        self.f4 = S4{ x: 4 };
        self.f5 = S5{ x: 5 };
    }
}
