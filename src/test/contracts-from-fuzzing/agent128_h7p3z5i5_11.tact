struct S1 {
    intVal: Int;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2?;
}

contract MultiOpt {
    s3: S3?;

    init() {
        self.s3 = S3{ s2: S2{ s1: S1{ intVal: 10 } } };
    }
}