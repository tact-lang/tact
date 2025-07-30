struct MixDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "abc";
    d: Int?;
    e: String? = null;
    f: Bool?;
}

contract MixDefaultsContract {
    data: MixDefaults;
    init() {
        self.data = MixDefaults{
            b: false,
            d: null,
            f: null
        };
    }
}