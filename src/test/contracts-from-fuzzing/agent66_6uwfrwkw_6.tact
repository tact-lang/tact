struct S1 {
    foo: Int;
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

struct S5 {
    corge: S4;
}

contract ManyNested {
    state: S5;

    init() {
        self.state = S5{
            corge: S4{
                qux: S3{
                    baz: S2{
                        bar: S1{
                            foo: 42
                        }
                    }
                }
            }
        };
    }
}