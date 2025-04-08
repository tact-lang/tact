struct DeepDefaults {
    a: Int = 7;
    b: Bool = true;
    c: Int?;
}

struct NestedDefaults {
    inner: DeepDefaults;
    d: Int = 42;
}

contract DefaultsTest {
    info: NestedDefaults;

    init() {
        self.info = NestedDefaults{
            inner: DeepDefaults{ a: 5, b: false, c: null },
            d: 100
        };
    }
}