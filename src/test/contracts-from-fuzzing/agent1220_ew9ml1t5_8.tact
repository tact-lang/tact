struct S1 {
    f: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

struct S4 {
    s3: S3;
}

contract VeryDeepNesting {
    deep: S4;

    init() {
        self.deep = S4{ s3: S3 { s2: S2{ s1: S1{ f: 7 } } } };
    }
}