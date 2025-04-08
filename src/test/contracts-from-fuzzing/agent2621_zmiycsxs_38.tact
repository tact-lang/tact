struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract Test {
    val: DeepDefaults;
    init() {
        self.val = DeepDefaults{};
    }
}