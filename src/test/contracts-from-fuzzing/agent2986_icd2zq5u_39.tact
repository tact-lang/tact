struct DefaultsHave {
    a: Int = 42;
    s: String = "hello";
}

contract OptionalWithDefaults {
    x: DefaultsHave?;

    init() {
        self.x = null;
    }
}