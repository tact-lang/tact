struct S1 {
    x: Int;
}

struct S2 {
    x: S1;
}

struct S3 {
    x: S2;
}

struct S4 {
    x: S3;
}

contract ChainNested {
    val: S4;

    init() {
        self.val = S4{
            x: S3{
                x: S2{
                    x: S1{
                        x: 42
                    }
                }
            }
        };
    }
}