struct DeepOptDefault {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract DeepDefault {
    inner: DeepOptDefault;

    init() {
        self.inner = DeepOptDefault{};
    }
}