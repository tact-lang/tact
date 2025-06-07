struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract DeepChain2 {
    f1: S3;
    f2: S2;
    f3: S1;

    init() {
        self.f1 = S3{c:S2{b:S1{a:1}}};
        self.f2 = S2{b:S1{a:2}};
        self.f3 = S1{a:3};
    }
}