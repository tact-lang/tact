struct DeepNestOptDefaults {
    p: Int? = 5;
    s: String? = "x";
    b: Bool? = true;
}

contract DeepNestOptDefaultsTest {
    d: DeepNestOptDefaults;

    init() {
        self.d = DeepNestOptDefaults{};
    }
}