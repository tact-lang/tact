struct S1 {
    foo: Int?
}

struct S2 {
    bar: S1?
}

struct S3 {
    baz: S2?
}

contract MultiLevelNull {
    data: S3;

    init() {
        self.data = S3{
            baz: null
        };
    }
}