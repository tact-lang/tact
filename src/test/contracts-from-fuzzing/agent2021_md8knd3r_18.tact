struct MixedDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "z";
}

contract MixedDefaultsTest {
    c: MixedDefaults;

    init() {
        self.c = MixedDefaults{};
    }
}
