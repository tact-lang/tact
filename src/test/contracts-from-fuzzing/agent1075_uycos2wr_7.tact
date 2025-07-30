struct S1 {
    a: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

struct S4 {
    inner: S3;
}

struct S5 {
    inner: S4;
}

struct S6 {
    inner: S5;
}

struct S7 {
    inner: S6;
}

contract Deep7Structs {
    data: S7;
    init() {
        self.data = S7{ inner: S6{ inner: S5{ inner: S4{ inner: S3{ inner: S2{ inner: S1{ a: 77 } } } } } } };
    }
}