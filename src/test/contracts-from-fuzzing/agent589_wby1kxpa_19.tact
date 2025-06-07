struct S1 {
    foo: Bool;
}

struct S2 {
    bar: S1;
}

struct S3 {
    baz: S2;
}

struct S4 {
    qux: S3;
}

contract DeepNest {
    field: S4;

    init() {
        self.field = S4{
            qux: S3{
                baz: S2{
                    bar: S1{
                        foo: true
                    }
                }
            }
        };
    }
}