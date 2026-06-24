struct WithDefaults {
    x: Int = 50;
    y: Bool?;
    z: String = "abc";
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{
            x: 100,
            y: null
        };
    }
}