struct InnerDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String? = null;
}

contract StructDefaults {
    s: InnerDefaults;

    init() {
        self.s = InnerDefaults{};
    }
}
