struct DeepDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Int?;
    e: Bool?;
    f: String?;
}

struct OutDefaults {
    x: DeepDefaults;
    y: DeepDefaults;
}

contract TestDeepDefaults {
    d: OutDefaults;

    init() {
        self.d = OutDefaults{
            x: DeepDefaults{},
            y: DeepDefaults{}
        };
    }
}