struct MixedDefaults {
    n: Int = 42;
    s: String = "default";
    f: Bool?;
}

contract TestContract {
    d: MixedDefaults;

    init() {
        self.d = MixedDefaults{};
    }
}