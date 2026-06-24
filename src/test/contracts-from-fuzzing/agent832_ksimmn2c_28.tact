struct MixOptDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract MixOptDefaults {
    data: MixOptDefault;

    init() {
        self.data = MixOptDefault{};
    }
}