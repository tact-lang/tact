struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
}

contract DefaultValsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}