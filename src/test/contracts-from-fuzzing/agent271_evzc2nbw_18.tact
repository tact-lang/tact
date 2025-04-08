struct DeepDefaults {
    x: Int = 1;
    inner: InnerDefault;
}

struct InnerDefault {
    y: Int = 2;
    s: String = "two";
}

contract DeepDefaultsTest {
    d: DeepDefaults;

    init() {
        self.d = DeepDefaults{ inner: InnerDefault{} };
    }
}
