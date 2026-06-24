struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
    b: Bool;
}

struct S3 {
    s2: S2;
    c: Int;
}

contract NestedThreeLevels {
    state: S3;

    init() {
        self.state = S3 { s2: S2 { s: S1 { a: 42 }, b: true }, c: 99 };
    }
}