struct OptDefaults {
    a: Int? = null;
    b: Bool? = false;
    c: String? = "hello";
}

contract OptDefaultsTest {
    val: OptDefaults;

    init() {
        self.val = OptDefaults{};
    }
}
