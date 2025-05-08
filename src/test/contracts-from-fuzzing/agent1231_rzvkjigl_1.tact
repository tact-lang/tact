struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    inner: Inner = Inner{a: 5, b: null};

    init() {
        self.inner = Inner{a: 10, b: true};
    }
}
