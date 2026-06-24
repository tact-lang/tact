struct S1 {
    a: Int; b: Int; c: Int;
}

struct S2 {
    s1: S1;
    d: Int;
    e: Bool?;
}

struct S3 {
    s2: S2;
    txt: String;
}

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            s2: S2{
                s1: S1{a:1, b:2, c:3},
                d: 4,
                e: null
            },
            txt: "test"
        };
    }

    receive() {}
}