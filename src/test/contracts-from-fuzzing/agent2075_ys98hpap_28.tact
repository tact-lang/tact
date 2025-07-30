struct WithDefault {
    a: Int = 5;
    b: String = "default";
}

contract DefaultsTest {
    val: WithDefault;

    init() {
        self.val = WithDefault{};
    }
}