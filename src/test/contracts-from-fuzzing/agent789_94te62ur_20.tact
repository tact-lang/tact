struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
}

contract DeepDefaultsTest {
    dd: DeepDefaults;

    init() {
        self.dd = DeepDefaults {
            d: null,
            e: null
        };
    }
}
