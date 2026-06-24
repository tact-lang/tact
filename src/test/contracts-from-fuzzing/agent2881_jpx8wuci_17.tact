struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }

struct Container {
    v1: S1;
    v2: S2;
    v3: S3;
}

contract SeveralDifferentStructs {
    s: Container;

    init() {
        self.s = Container{
            v1: S1{ a: 1 },
            v2: S2{ b: 2 },
            v3: S3{ c: 3 }
        };
    }
}