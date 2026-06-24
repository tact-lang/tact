struct S1 {
    x: Int;
}

struct S2 {
    a: S1;
}

struct S3 {
    b: S2;
}

struct S4 {
    c: S3;
}

contract DeepFour {
    val: S4;

    init() {
        self.val = S4{ c: S3{ b: S2{ a: S1{x:42} } } };
    }
}