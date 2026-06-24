struct DeepField {
    s1: S1;
    s2: S2;
}

struct S1 {
    i: Int;
}

struct S2 {
    s3: S3;
}

struct S3 {
    flag: Bool;
    msg: String?;
}

contract DeepFieldContract {
    data: DeepField;

    init() {
        self.data = DeepField{
            s1: S1{ i: 1 },
            s2: S2{ s3: S3{ flag: true, msg: null } }
        };
    }
}