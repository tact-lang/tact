struct Inner {
    a: Int;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Inner;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "hi";
        self.d = Inner{ a: 5 };
    }

    receive() {}
}