struct DefaultsAndOptionals {
    a: Int = 10;
    b: Bool?;
    c: String = "zzz";
    d: Int?;
    e: Bool = false;
}

contract MixedDefaults {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{
            b: null,
            d: null
        };
    }
}