struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    inner1: S1;
    flag: Bool;
}

struct S3 {
    inner2: S2;
    num: Int;
    optStr: String?;
}

contract TestStructChain {
    data: S3;

    init() {
        self.data = S3{
            inner2: S2{
                inner1: S1{
                    a: 7,
                    b: "deep",
                },
                flag: false,
            },
            num: 9,
            optStr: null,
        };
    }
}
