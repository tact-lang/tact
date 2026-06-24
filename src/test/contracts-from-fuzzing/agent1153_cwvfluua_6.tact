struct DeeplyNestedStruct {
    s1: S1;
}

struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    value: Int;
}

contract NestedStorage {
    store: DeeplyNestedStruct;

    init() {
        self.store = DeeplyNestedStruct{
            s1: S1{
                s2: S2{
                    s3: S3{
                        value: 123
                    }
                }
            }
        };
    }
}