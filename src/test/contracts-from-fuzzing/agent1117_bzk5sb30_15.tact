struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { s1: S1 }
struct S4 { s2: S2 }

contract MultiStruct {
    s3: S3;
    s4: S4;

    init() {
        self.s3 = S3{ s1: S1{ a: 10 } };
        self.s4 = S4{ s2: S2{ b: 20 } };
    }
}
