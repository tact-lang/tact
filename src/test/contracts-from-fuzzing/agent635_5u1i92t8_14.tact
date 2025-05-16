struct S1 {
    x: Int;
}

struct S2 {
    x: S1;
}

struct S3 {
    x: S2;
}

struct S4 {
    x: S3;
}

struct S5 {
    x: S4;
}

contract DeepFive {
    val: S5;

    init() {
        self.val = S5{ x: S4{ x: S3{ x: S2{ x: S1{ x: 123 } } } } };
    }
}