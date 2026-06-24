struct S1 {
    a: Int;
}

struct S2 {
    s1a: S1;
}

struct S3 {
    s2a: S2;
}

struct S4 {
    s3a: S3;
}

struct S5 {
    s4a: S4;
}

contract DeepChain {
    chain: S5 = S5{ s4a: S4{ s3a: S3{ s2a: S2{ s1a: S1{ a: 5 } } } } };
}