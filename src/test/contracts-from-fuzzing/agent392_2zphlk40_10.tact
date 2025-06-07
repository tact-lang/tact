struct MixedDefaults {
    a: Int = 10;
    b: Bool;
    c: String = "hello";
    d: Int?;
    e: String? = "optional";
}

contract MixedDefaultsContract {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{
            b: true,
            d: null
        };
    }
}
