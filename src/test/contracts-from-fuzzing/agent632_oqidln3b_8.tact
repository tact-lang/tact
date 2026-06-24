struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

struct S3 {
    s1: S1;
    s2: S2;
    c: String;
}

contract TestContract {
    foo: S3;

    init() {
        self.foo = S3{
            s1: S1{ a: 1 },
            s2: S2{ b: true },
            c: "abc"
        };
    }
}