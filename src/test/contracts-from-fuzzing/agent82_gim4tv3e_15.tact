struct Defaulted {
    a: Int = 42;
    b: String = "text";
    c: Bool = false;
}

contract Test {
    inner: Defaulted;

    init() {
        self.inner = Defaulted{};
    }
}
