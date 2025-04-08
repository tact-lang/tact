struct S1 {
    val: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2: S2;
    num: Int;
}

contract MultiNest {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{s1a: S1{val: 1}, s1b: S1{val: 2}},
            num: 42
        };
    }
}