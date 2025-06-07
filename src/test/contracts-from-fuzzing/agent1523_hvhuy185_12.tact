struct S1 {
    x: Int;
}

struct S2 {
    a: S1;
    b: Int;
}

struct S3 {
    a: S2;
    b: S1;
}

struct S4 {
    a: S3;
    b: S2;
}

contract TestContract {
    nested: S4;

    init() {
        self.nested = S4{
            a: S3{ a: S2{ a: S1{ x:1 }, b:2 }, b:S1{ x:3 } },
            b: S2{ a: S1{ x:4 }, b:5 }
        };
    }
}