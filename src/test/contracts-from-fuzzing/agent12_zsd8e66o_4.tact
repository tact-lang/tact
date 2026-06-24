struct Inner {
    a: Int = 1;
    b: Bool = true;
    s: String = "abc";
}

contract TestContract {
    inner: Inner = Inner{};

    init() {
        self.inner = Inner{a: 99, b: false, s: "xyz"};
    }
}