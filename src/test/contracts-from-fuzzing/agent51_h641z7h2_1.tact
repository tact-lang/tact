struct Inner {
    foo: Int = 1;
    bar: String = "bar";
    zap: Bool = true;
}

contract Test {
    val: Inner;
    init() {
        self.val = Inner{};
    }
}