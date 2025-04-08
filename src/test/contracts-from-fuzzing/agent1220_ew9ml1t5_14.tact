struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsTest {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{
            d: null,
            e: null,
            f: null
        };
    }
}