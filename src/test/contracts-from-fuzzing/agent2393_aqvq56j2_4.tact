struct S1 {
    a: Int;
}

struct S2 {
    sa: S1;
}

struct S3 {
    sa2: S2;
}

struct S4 {
    sa3: S3;
}

contract DeepChain {
    f: S4 = S4{ sa3: S3{ sa2: S2{ sa: S1{ a: 123 } } } };
}