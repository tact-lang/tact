struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: S1;
    d: Int;
}

struct S3 {
    e: S2;
    f: String = "hi";
}

contract NestedDefaultsTest {
    s: S3;

    init() {
        self.s = S3{
            e: S2{
                c: S1{
                    a: 10,
                    b: false
                },
                d: 20
            },
            // omit f to use default
        };
    }
}