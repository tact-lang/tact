struct Inner {
    a: Int = 1;
    b: Bool = true;
    s: String = "ok";
}

contract DefaultsInStructField {
    inner: Inner;

    init() {
        self.inner = Inner{};
    }
}