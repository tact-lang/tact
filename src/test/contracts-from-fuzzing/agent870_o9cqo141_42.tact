struct OptionalAndDefaults {
    foo: Int? = null;
    bar: String? = null;
    flag: Bool = true;
}

contract OptDefaultsTest {
    val: OptionalAndDefaults;

    init() {
        self.val = OptionalAndDefaults{};
    }
}