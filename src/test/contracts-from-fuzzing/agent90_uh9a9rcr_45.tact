struct DeepDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "text";
}

struct WrapDefaults {
    inner: DeepDefaults;
}

contract DeepDefaultsContract {
    data: WrapDefaults;
    init() {
        self.data = WrapDefaults{ inner: DeepDefaults{} };
    }
}