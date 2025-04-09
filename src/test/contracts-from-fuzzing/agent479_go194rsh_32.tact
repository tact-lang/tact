struct SetDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
}

contract OptionalDefaults {
    inner: SetDefaultOpt = SetDefaultOpt{};

    init() {
        self.inner = SetDefaultOpt{};
    }
}