contract A {
    a: Int;
    b: Bool;

    init(a: Int, b: Bool) {
        self.a = a;
        self.b = b;
    }
}

contract B {
    init() {
        initOf A(1, false);
    }
}