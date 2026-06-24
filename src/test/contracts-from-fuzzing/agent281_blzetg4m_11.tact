struct MixedDefaultsOptionals {
    a: Int = 0;
    b: Bool?;
    c: String? = null;
    d: Int?;
}

contract MixedDefaultsOptsStorage {
    data: MixedDefaultsOptionals;

    init() {
        self.data = MixedDefaultsOptionals{
            b: null,
            d: null
        };
    }
}