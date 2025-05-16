struct S1 {
    v1: Int;
    v2: Bool;
}

struct S2 {
    v1: Int;
    nested: S1;
}

struct S3 {
    nested: S2;
    optionalStr: String?;
}

contract TestContract {
    field: S3;

    init() {
        self.field = S3{
            nested: S2{
                v1: 1,
                nested: S1{
                    v1: 2,
                    v2: false
                }
            },
            optionalStr: null
        };
    }

    receive() {}
}