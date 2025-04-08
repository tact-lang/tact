struct S1 {
    value: Int;
}

struct S2 {
    inner: S1;
}

struct S3 {
    inner: S2;
}

contract DeepNestingTest {
    data: S3;

    init() {
        self.data = S3{ inner: S2{ inner: S1{ value: 123 } } };
    }
}
