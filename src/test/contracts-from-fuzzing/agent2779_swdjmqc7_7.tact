struct DefaultsMixed {
    a: Int = 3;
    b: Bool;
    c: String = "x";
}

contract MixedDefaults {
    mixed: DefaultsMixed;
    init() {
        self.mixed = DefaultsMixed{
            b: true
        };
    }
}