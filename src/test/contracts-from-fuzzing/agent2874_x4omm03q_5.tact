struct Inner {
    a: Int? = null;
    b: String? = "default";
}

contract TestContract {
    data: Inner = Inner{};

    init() {
        self.data = Inner{a: 42, b: "set"};
    }
}
