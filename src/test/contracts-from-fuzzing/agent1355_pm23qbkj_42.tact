struct LargeDefaults {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}
contract ManyDefaults {
    f: LargeDefaults;
    init() {
        self.f = LargeDefaults{};
    }
}