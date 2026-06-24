struct DeepDefaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "ok";
    n: Int? = null;
}

contract DefaultsTest {
    d: DeepDefaults;
    
    init() {
        self.d = DeepDefaults{};
    }
}
