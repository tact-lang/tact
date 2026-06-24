struct DeepDefaults {
    s: String = "foo";
    b: Bool = true;
    n: Int = 7;
}

contract DefNested {
    d: DeepDefaults;

    init() {
        self.d = DeepDefaults{};
    }
}