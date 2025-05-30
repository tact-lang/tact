struct S1 {
    x: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

contract MultiLevelNest {
    data: S3;

    init() {
        self.data = S3{ inner: S2{ inner: S1{ x: 42 } } };
    }
}
