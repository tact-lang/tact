struct S0 {
    i: Int;
}

struct S1 {
    s: S0;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract TestContract {
    s: S3;

    init() {
        self.s = S3{ s: S2{ s:S1{ s:S0{ i:555 } } } };
    }
}