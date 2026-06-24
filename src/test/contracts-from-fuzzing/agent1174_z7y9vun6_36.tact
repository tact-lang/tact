struct MixedDefaults {
    a: Int = 1;
    b: Int;
    c: Bool = true;
}

contract MixedDefaultFields {
    f: MixedDefaults;

    init() {
        self.f = MixedDefaults{ b: 42 };
    }
}