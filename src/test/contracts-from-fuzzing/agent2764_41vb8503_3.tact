struct S1 {
    f1: Int;
}

struct S2 {
    nested: S1;
}

struct S3 {
    nested: S2;
}

struct S4 {
    nested: S3;
}

contract FourNested {
    field: S4;

    init() {
        self.field = S4{
            nested: S3{
                nested: S2{
                    nested: S1{
                        f1: 99
                    }
                }
            }
        };
    }
}