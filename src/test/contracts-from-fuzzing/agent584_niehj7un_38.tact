struct X {
    a: Int;
    b: String;
}

contract OptStructDefault {
    test: X? = null;

    init() {
        self.test = X{ a: 7, b: "bob" };
    }
}