struct S1 {
    a: Int?;
}

struct S2 {
    b: S1?;
}

struct S3 {
    c: S2?;
}

contract MultiLevelOptionals {
    deepOpt: S3?;

    init() {
        self.deepOpt = null;
    }
}