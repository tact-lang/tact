struct Inner1 { a: Int; }

contract Test {
    s: Inner1;

    init() {
        self.s = Inner1{ a: 5 };
    }
}