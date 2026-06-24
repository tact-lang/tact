struct WithDefaults {
    x: Int = 42;
    y: Bool;
    z: String = "hello";
}

contract DefTest {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{
            y: true,
        };
    }
}