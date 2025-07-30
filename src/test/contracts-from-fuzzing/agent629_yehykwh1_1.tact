struct Inner {
    a: Int = 1;
    b: Bool?;
    c: String = "test";
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{};
    }
}
