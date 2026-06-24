struct S1 {
    x: Int = 5;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2?;
}

struct S4 {
    s3: S3?;
}

contract DeepOpt {
    s4: S4 = S4{ s3: null };
    init() {}
}