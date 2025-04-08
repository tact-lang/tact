struct MixOptDefaults {
    a: Int? = null;
    b: Bool = true;
    c: String? = null;
}

contract MixOptDefaultsTest {
    data: MixOptDefaults;

    init() {
        self.data = MixOptDefaults{};
    }
}
