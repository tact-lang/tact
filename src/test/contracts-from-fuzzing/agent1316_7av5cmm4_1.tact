struct Inner {
    a: Int;
    b: Bool?;
}

contract Test {
    data: Inner = Inner{a: 10, b: null};

    init() {
        self.data = Inner{a: 20, b: true};
    }
}
