struct S1 {
    a: Int;
}

struct S2 {
    a: S1;
}

struct S3 {
    a: S2;
}

contract DeepThreeStructs {
    val: S3;

    init() {
        self.val = S3{ a: S2{ a: S1{ a: 100 } } };
    }
}