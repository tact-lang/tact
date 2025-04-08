struct S1 {
    f: Int;
}

struct S2 {
    nested: S1;
}

struct S3 {
    nested: S2;
}

contract DeepDeeper {
    rec: S3;

    init() {
        self.rec = S3{
            nested: S2{
                nested: S1{
                    f: 99
                }
            }
        };
    }
}