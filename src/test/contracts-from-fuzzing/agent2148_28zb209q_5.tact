struct S1 {
    first: Int;
}

struct S2 {
    second: S1;
}

struct S3 {
    third: S2;
}

struct S4 {
    fourth: S3;
}

contract Layered {
    data: S4;

    init() {
        self.data = S4{ fourth: S3{ third: S2{ second: S1{ first: 123 } } } };
    }
}