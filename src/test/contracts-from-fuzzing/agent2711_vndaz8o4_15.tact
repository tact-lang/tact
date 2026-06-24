struct MultiDefaults {
    x: Int = 1;
    y: String = "two";
    z: Bool = false;
}

contract InitNoOverride {
    mf: MultiDefaults;

    init() {
        self.mf = MultiDefaults{};
    }
}