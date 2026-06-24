struct S {
    a: Int;
}

contract OptStructField {
    s: S?;

    init() {
        self.s = S { a: 77 };
    }

    receive() {}
}