struct DeeplyNested {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    s4: S4;
}

struct S4 {
    value: Int;
}

contract DeepNestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s2: S2{
                s3: S3{
                    s4: S4{
                        value: 42
                    }
                }
            }
        };
    }
}