struct S1 {
    a: Int = 1;
}
struct S2 {
    b: Int = 2;
}
struct S3 {
    c: Int = 3;
}
struct S4 {
    d: Int = 4;
}

contract TestContract {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;

    init() {
        self.s1 = S1{ a: 10 };
        self.s2 = S2{ b: 20 };
        self.s3 = S3{ c: 30 };
        self.s4 = S4{ d: 40 };
    }
}