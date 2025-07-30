struct DeepDefaults {
    a: Int = 1;
    b: String = "s";
}

struct Layer {
    d: DeepDefaults = DeepDefaults{};
    flag: Bool = false;
}

contract DeepDefContract {
    store: Layer;

    init() {
        self.store = Layer{};
    }
}
