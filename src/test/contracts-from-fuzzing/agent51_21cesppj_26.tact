struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "zero";
}

contract DefaultDeepTest {
    inner: DeepDefaults = DeepDefaults{};

    init() {
        self.inner = DeepDefaults{ a:5, b:true, c:"five" };
    }
}