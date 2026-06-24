// deeply nested opt -> struct -> opt -> struct test
struct S1 {
    x: Int;
}

struct S2 {
    a: S1?;
}

struct S3 {
    b: S2;
}

struct S4 {
    c: S3?;
}

contract TestContract {
    data: S4;

    init() {
        self.data = S4{c: null};
    }
}