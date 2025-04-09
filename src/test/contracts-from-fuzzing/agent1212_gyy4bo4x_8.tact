struct DefaultsAndNon {
    a: Int = 1;
    b: Bool;
    c: String = "x";
    d: Int;
}

contract MixedDefaults {
    v: DefaultsAndNon;

    init() {
        self.v = DefaultsAndNon{
            b: false,
            d: 42
        };
    }
}