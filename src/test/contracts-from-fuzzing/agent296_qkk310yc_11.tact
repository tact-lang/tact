struct S1 {
    a: Int;
    b: Bool?
}

struct S2 {
    c: S1;
    d: String?;
}

struct S3 {
    e: S2;
}

contract MultiNestedOptional {
    data: S3;

    init() {
        self.data = S3{
            e: S2{
                c: S1{
                    a: 123,
                    b: null
                },
                d: null
            }
        };
    }
}
