struct WithDefaults {
    a: Int = 123;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultsOverride {
    rec: WithDefaults;

    init() {
        self.rec = WithDefaults{
            a: 999,
            c: "xyz"
        };
    }
}