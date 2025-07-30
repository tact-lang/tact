struct NestedInitialized {
    i: Int = 1;
    b: Bool = true;
}

contract InitDefaults {
    f: NestedInitialized;

    init() {
        self.f = NestedInitialized{};
    }
}