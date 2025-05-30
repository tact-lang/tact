// deeply nested struct chain without optionals
struct S3 {
    c: Int;
}

struct S2 {
    b: S3;
}

struct S1 {
    a: S2;
}

contract TestContract {
    field: S1;

    init() {
        self.field = S1{a: S2{b: S3{c: 42}}};
    }
}