struct S1 {
    v: Int;
}

struct S2 {
    v: Int;
    s: S1;
}

struct S3 {
    v: Int;
    s: S2;
}

struct S4 {
    v: Int;
    s: S3;
}

contract DeepNestTest {
    field: S4;

    init() {
        self.field = S4{
            v:1,
            s:S3{
                v:2,
                s:S2{
                    v:3,
                    s:S1{
                        v:4
                    }
                }
            }
        };
    }

    receive() {}
}