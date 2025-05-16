struct S1 {
    i: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract TestContract {
    s3: S3;
    optionalInt: Int?;
    flag: Bool?;

    init() {
        self.s3 = S3{ s2: S2{ s1: S1{ i: 777 } } };
        self.optionalInt = null;
        self.flag = null;
    }
}