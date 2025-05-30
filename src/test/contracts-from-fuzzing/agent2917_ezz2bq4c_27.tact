struct MixedDefaultsOptionals {
    a: Int? = null;
    b: String = "default";
    c: Bool? = true;
}

contract MixedDefaults {
    f: MixedDefaultsOptionals;

    init() {
        self.f = MixedDefaultsOptionals{};
    }
}
