struct S {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
}

contract Test {
    s: S;
    init() {
        self.s = S{};
    }
}