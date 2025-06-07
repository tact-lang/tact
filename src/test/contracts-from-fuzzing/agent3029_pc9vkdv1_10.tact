struct DefaultsAndOptionals {
    a: Int = 5;
    b: String?;
    c: Bool = true;
    d: Int?;
}

contract MixDefaultsNullables {
    f: DefaultsAndOptionals;

    init() {
        self.f = DefaultsAndOptionals{
            b: null,
            d: null
        };
    }
}