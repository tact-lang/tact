struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct S3 {
    s1: S1;
    s2: S2;
    flag: Bool;
}

contract MultipleStructs {
    data: S3;

    init() {
        self.data = S3{
            s1: S1{a: 1},
            s2: S2{b: 2},
            flag: true,
        };
    }
}