struct MixedDefaults {
    a: Int = 5;
    b: Int;
    c: String = "abc";
    d: Bool;
}

contract MixedDefaultsContract {
    data: MixedDefaults;
    init() {
        self.data = MixedDefaults{
            b: 3,
            d: false
        };
    }
}