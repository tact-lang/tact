struct Inner {
    a: Int = 1;
    b: Bool?;
    c: String?;
}

contract Test {
    data: Inner = Inner{};

    init() {
        self.data = Inner{ a: 42, b: true, c: "hi" };
    }
}