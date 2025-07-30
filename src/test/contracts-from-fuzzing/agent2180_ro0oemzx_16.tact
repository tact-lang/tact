struct DeepDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsTest {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{};
    }
}