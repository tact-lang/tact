struct DefaultAndNonDefault {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Int;
}

contract MixedDefaults {
    state: DefaultAndNonDefault;

    init() {
        self.state = DefaultAndNonDefault{
            b: true, d: 42
        };
    }
}