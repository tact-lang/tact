struct S1 {
    i: Int;
}

struct S2 {
    i: Int;
}

struct S3 {
    s1: S1;
    s2: S2;
}

contract MultiNestedDiff {
    data: S3 = S3{
        s1: S1{i:1},
        s2: S2{i:2},
    };
    init() {
        self.data = S3{
            s1: S1{i:3},
            s2: S2{i:4},
        };
    }
}
