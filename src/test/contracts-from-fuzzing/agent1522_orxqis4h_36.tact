struct DeepDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract InitDefaults {
    s: DeepDefaults;
    init() {
        self.s = DeepDefaults{};
    }
    receive() {
        let _ = self.s;
    }
}