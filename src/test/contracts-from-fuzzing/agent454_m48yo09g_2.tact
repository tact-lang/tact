struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    s: Inner;
    init() {
        self.s = Inner{ a: 1, b: true, c: "x" };
    }
}