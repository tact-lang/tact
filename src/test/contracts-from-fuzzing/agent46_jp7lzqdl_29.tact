struct S {
    a: Int?;
}

contract OptionalStructFieldTest {
    s: S;

    init() {
        self.s = S{ a: null };
    }
}
