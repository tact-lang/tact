struct S1 {
    f1: Int?;
    f2: Bool?;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2?;
}

contract NestedChainNulls {
    deep: S3;

    init() {
        self.deep = S3{
            s2: null
        };
    }
}