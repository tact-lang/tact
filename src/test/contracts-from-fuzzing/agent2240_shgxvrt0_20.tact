struct S {
    a: Int;
    b: Int?;
}

contract NullableTest {
    s: S?;

    init() {
        self.s = S{ a: 1, b: null };
    }
}