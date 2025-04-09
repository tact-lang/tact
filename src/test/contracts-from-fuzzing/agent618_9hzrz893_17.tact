struct Inner {
    x: Int = 41;
    y: Bool = true;
}

contract DefaultedStructField {
    s: Inner;

    init() {
        self.s = Inner{};
    }
}