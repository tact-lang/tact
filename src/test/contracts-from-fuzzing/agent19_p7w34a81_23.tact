struct S1 { val: Int; }
struct S2 { val: Int; }
struct S3 { val: Int; }
struct S4 { val: Int; }

contract ManyStructRefs {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;

    init() {
        self.f1 = S1{ val: 1 };
        self.f2 = S2{ val: 2 };
        self.f3 = S3{ val: 3 };
        self.f4 = S4{ val: 4 };
    }
}