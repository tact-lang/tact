struct S {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract Test {
    s: S;

    init() {
        self.s = S{};
    }
}