struct InnerDefault {
    x: Int = 5;
    y: String = "ok";
    z: Bool = true;
}

contract HasDefaults {
    inner: InnerDefault;

    init() {
        self.inner = InnerDefault{};
    }
}