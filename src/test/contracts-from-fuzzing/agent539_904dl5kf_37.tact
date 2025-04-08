struct MultiDefault {
    a: Int = 42;
    b: Bool = true;
    s: String = "hi";
}

contract TestContract {
    md: MultiDefault;
    init() {
        self.md = MultiDefault{};
    }
}