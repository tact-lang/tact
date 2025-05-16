struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract DeepChain {
    data: S3 = S3{ c: S2{ b: S1{ a: 123 } } };

    receive() {}
}