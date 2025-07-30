struct Inner {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract OptEmpty {
    f: Inner?;

    init() {
        self.f = Inner{};
    }
}
