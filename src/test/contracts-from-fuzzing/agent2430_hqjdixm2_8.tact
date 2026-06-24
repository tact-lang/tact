struct S1 {
    f1: Int;
}

struct S2 {
    f2: Int;
    s1: S1;
}

struct S3 {
    f3: Int;
    s2: S2;
}

contract Contract {
    var: S3;

    init() {
        self.var = S3{ f3: 3, s2: S2{ f2: 2, s1: S1{ f1: 1 } } };
    }
}