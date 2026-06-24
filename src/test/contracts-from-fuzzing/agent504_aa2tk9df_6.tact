struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    s: String = "abc";
}

contract StructDefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}