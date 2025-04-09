struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: String? = null;
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}