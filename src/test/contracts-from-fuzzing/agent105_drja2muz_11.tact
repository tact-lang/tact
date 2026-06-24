struct S1 {
    foo: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

struct S4 {
    s3: S3;
    s2: S2;
    s1: S1;
}

contract TestContract {
    x: S4;

    init() {
        self.x = S4{
            s3: S3{
                s2a: S2{
                  s1a: S1{foo:1}, s1b: S1{foo:2}
                },
                s2b: S2{
                  s1a: S1{foo:3}, s1b: S1{foo:4}
                }
            },
            s2: S2{
                s1a: S1{foo:5}, s1b: S1{foo:6}
            },
            s1: S1{foo:7}
        };
    }

    receive() {}
}