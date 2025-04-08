struct S1 {
    a: Int;
    b: String;
    c: Bool;
}

struct S2 {
    x: S1;
    y: Int;
}

struct S3 {
    s2: S2;
    flag: Bool;
}

contract S3Test {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                x: S1{
                    a: 12,
                    b: "hi",
                    c: false,
                },
                y: 34,
            },
            flag: true,
        };
    }
}
