struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ a: 1, b: true, s: "hi" };
    }
}
