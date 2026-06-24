struct DefaultsAndNonDefaults {
    a: Int = 1;
    b: String;
    c: Bool = false;
}

contract MixedDefaultsFields {
    storage: DefaultsAndNonDefaults;

    init() {
        self.storage = DefaultsAndNonDefaults{
            b: "data"
        };
    }
}