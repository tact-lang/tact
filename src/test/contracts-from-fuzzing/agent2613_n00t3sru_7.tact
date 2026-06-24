struct WithDefaults {
    x: Int = 42;
    y: Bool = true;
    s: String = "hey";
    o: Int? = null;
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}