struct Boo {
    foo: Int;
}

contract TwoVars {
    a: Boo;
    b: Boo;

    init() {
        self.a = Boo{ foo: 1 };
        self.b = Boo{ foo: 2 };
    }
}