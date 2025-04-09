struct S {
    a: String;
    b: Int?;
}

contract DefaultOptionalTest {
    s: S;

    init() {
        self.s = S{ a: "hi", b: null };
    }
}