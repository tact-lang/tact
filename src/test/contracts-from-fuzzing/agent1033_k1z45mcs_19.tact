struct S3 {
    s: String;
}

struct S2 {
    s3: S3;
    v: Int;
}

struct S1 {
    s2: S2;
    flag: Bool;
}

contract MixedNest {
    data: S1;

    init() {
        self.data = S1{
            s2: S2{ s3: S3{ s: "yo" }, v: 5 },
            flag: false
        };
    }
}