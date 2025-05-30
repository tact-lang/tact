struct S1 {
    v1: Int;
}
struct S2 {
    v2: Int;
}
struct S3 {
    v3: Int;
}

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{v1:1};
        self.f2 = S2{v2:2};
        self.f3 = S3{v3:3};
    }
}