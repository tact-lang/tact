struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String? = "bye";
}

contract MixedDefaultsContract {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{
            b: true,
        };
    }
}