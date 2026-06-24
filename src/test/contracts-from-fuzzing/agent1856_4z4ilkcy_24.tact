struct OptionalDefaultsAndValues {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;
}

contract MixDefaults {
    val: OptionalDefaultsAndValues;

    init() {
        self.val = OptionalDefaultsAndValues{
            a: null,
            b: 1,
            c: null,
            d: false,
            e: null,
            f: "x"
        };
    }
}
