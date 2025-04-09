struct S1 { a: Int; }
contract C1 {
    s: S1;

    init() {
        self.s = S1{ a: 5 };
    }
}