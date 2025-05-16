struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    nested: S1;
}

struct S3 {
    c: Int;
    nested: S2;
}

contract DeepChain {
    data: S3;

    init() {
        self.data = S3{
            c: 3,
            nested: S2{
                b: 2,
                nested: S1{
                    a: 1
                }
            }
        };
    }
}