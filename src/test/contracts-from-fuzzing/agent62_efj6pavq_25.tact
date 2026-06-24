struct MixDefaults {
    a: Int = 42;
    b: Int? = null;
    c: String? = null;
    d: Bool = true;
}

contract MixDefaultsStorage {
    d: MixDefaults;

    init() {
        self.d = MixDefaults{};
    }
}