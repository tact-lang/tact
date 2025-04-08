struct S1 {
    v1: Int;
}

struct S2 {
    v2: Int;
    s1: S1;
}

struct S3 {
    s2: S2;
    b: Bool;
}

contract ThreeLevelStruct {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{ v2:5, s1:S1{v1:10}},
            b: true
        };
    }
}
