struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
    c: Int;
}

struct S3 {
    d: S2;
    e: Bool;
}

contract ChainNest {
    field: S3;

    init() {
        self.field = S3{ d: S2{b: S1{a: 99}, c: 1}, e: true };
    }
}