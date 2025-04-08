struct S1 {
    x: Int;
}
struct S2 {
    y: Bool;
}
struct S3 {
    z: String;
}

struct BigNest {
    s1: S1;
    s2: S2;
    s3: S3;
    optI: Int?;
    optS: String?;
}

contract VariedTypes {
    all: BigNest;

    init() {
        self.all = BigNest{
            s1: S1{ x: 1 },
            s2: S2{ y: true },
            s3: S3{ z: "z" },
            optI: null,
            optS: null,
        };
    }
}