struct OptionalAndDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "word";
}

contract OptDefaultsTest {
    val: OptionalAndDefaults;

    init() {
        self.val = OptionalAndDefaults{};
    }
}