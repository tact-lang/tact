struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Int;
}

struct S3 {
    s2: S2;
    z: Int;
}

contract NestedInlineDefaults {
    state: S3;

    init() {
        self.state = S3{
            s2: S2{
                s1: S1{x: 10},
                y: 20,
            },
            z: 30,
        };
    }
}
