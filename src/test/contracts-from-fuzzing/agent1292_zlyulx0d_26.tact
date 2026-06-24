struct MixOptDefaults {
    a: Int = 1;
    b: Int?;
    c: String = "text";
    d: Bool?;
}

contract MixOptDefaultsContract {
    content: MixOptDefaults;

    init() {
        self.content = MixOptDefaults{
            b: null,
            d: null,
        };
    }
}