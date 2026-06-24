struct S1 {
    a: Int;
}

struct S2 {
    a: Int;
    b: String;
}

struct S3 {
    a: Bool;
    b: String?;
}

contract MultipleStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{ a: 1 };
        self.s2 = S2{ a:2, b:"b" };
        self.s3 = S3{ a:true, b:null };
    }
}