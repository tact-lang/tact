struct MixedOptionalsAndDefaults {
    a: Int = 1;
    b: Int?;
    c: String = "hello";
    d: String?;
}

contract MixedStorage {
    val: MixedOptionalsAndDefaults;

    init() {
        self.val = MixedOptionalsAndDefaults{
            b: null,
            d: null,
        };
    }
}