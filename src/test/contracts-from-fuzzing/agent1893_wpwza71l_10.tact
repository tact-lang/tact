struct S1 {
    f: Int;
}

struct S2 {
    f: Int;
    nested: S1;
}

struct S3 {
    f: Int;
    nested: S2;
}

struct S4 {
    f: Int;
    nested: S3;
}

contract Nest4 {
    val: S4;

    init() {
        self.val = S4{ f:0, nested: S3{ f: 1, nested: S2{ f:2, nested: S1{ f:3 } } } };
    }
}