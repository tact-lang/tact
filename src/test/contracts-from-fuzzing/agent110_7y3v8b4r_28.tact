struct S {
    a: Int?;
    b: String?;
}

contract SetSomeOptionals {
    s: S;

    init() {
        self.s = S{ a: 42, b: "hello" };
    }
}