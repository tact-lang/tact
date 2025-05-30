struct Inner {
    v: Int? = null;
}

contract OuterOptInner {
    x: Inner?;

    init() {
        self.x = Inner{};
    }
}