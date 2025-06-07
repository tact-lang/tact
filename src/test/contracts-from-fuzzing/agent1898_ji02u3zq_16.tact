struct DeepDefaults {
    inner: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 10;
    y: Bool = false;
}

contract WithNestedDefaults {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{ inner: InnerDefaults{} };
    }
}