struct S1 {
    a: Int;
}
struct S2 {
    a: Int;
}
struct S3 {
    a: Int;
}
struct S4 {
    a: Int;
}
struct S5 {
    a: Int;
}

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;

    init() {
        self.f1 = S1{ a:1 };
        self.f2 = S2{ a:2 };
        self.f3 = S3{ a:3 };
        self.f4 = S4{ a:4 };
        self.f5 = S5{ a:5 };
    }
}