struct S1 { i: Int; }
struct S2 { s: String }
struct S3 { b: Bool }
contract ManyStructsVar {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{ i: 1 };
        self.f2 = S2{ s: "a" };
        self.f3 = S3{ b: true };
    }
}