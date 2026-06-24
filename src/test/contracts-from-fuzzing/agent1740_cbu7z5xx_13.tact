struct DefaultsAndOptionals {
    a: Int = 1;
    b: Bool = true;
    c: String?;
    d: Address?;
}

contract MixedDefaultsOptionals {
    val: DefaultsAndOptionals;

    init() {
        self.val = DefaultsAndOptionals {
            c: null,
            d: null
        };
    }
}