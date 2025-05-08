struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    c: Bool;
    nested: S1;
}

struct S3 {
    s2: S2;
    val: String;
}

contract WideNested {
    state: S3;

    init() {
        self.state = S3{
            s2: S2{
                b: 5,
                c: true,
                nested: S1{
                    a: 7
                }
            },
            val: "test",
        };
    }
}