struct DeepDefaults {
    foo: Int = 10;
    bar: Bool = false;
    baz: String = "str";
}

contract DefaultsContract {
    val: DeepDefaults;

    init() {
        self.val = DeepDefaults{};
    }
}