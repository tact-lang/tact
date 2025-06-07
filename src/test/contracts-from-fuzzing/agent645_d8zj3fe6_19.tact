struct S1 {
    a: Int;
}
struct S2 {
    b: Int;
}
struct S3 {
    c: Int;
}

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{a:1};
        self.f2 = S2{b:2};
        self.f3 = S3{c:3};
    }
}
