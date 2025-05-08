struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    s4: S4;
}

struct S4 {
    x: Int;
}

contract Test {
    value: S1;

    init() {
        self.value = S1{
            s2: S2{
                s3: S3{
                    s4: S4{
                        x: 999
                    }
                }
            }
        };
    }
}