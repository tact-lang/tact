struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: S1;
}

struct S3 {
    e: S2;
    f: Int;
}

contract CrossNestingTest {
    data: S3;

    init() {
        self.data = S3{
            e: S2{
                c: "hi",
                d: S1{
                    a: 10,
                    b: true
                }
            },
            f: 100
        };
    }
}