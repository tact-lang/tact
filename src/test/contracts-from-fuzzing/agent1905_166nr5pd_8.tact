struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: S1;
    y: Int;
}

struct S3 {
    m: S2;
    n: Bool;
}

contract MultipleNestedStructs {
    s: S3;

    init() {
        self.s = S3{
            m: S2{
                x: S1{
                    a: 7,
                    b: false,
                },
                y: 8,
            },
            n: true,
        };
    }
}