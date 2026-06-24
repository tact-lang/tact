struct S {
    a: Int;
    b: Int? = null;
    c: Int = 5;
    d: Bool = false;
}

contract Test {
    x: S;
    init() {
        self.x = S{ a: 10 };
    }
}