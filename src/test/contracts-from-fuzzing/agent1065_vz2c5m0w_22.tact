struct MixedOptionDefaults {
    a: Int?;
    b: Int = 0;
    c: Bool?;
    d: Bool = false;
}

contract MixedOptionDefaultsContract {
    val: MixedOptionDefaults;

    init() {
        self.val = MixedOptionDefaults{};
    }
}
