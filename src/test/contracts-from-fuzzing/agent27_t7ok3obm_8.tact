struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{
            a: 42,
            b: false,
            c: "override"
        };
    }
}
