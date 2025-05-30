struct WithEmptyDefaults {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}

contract TestStructDefaults {
    inner: WithEmptyDefaults;

    init() {
        self.inner = WithEmptyDefaults{};
    }
}