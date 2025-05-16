struct DeepDefaults {
    s1: Int = 42;
    s2: Bool = false;
    s3: String = "s";
}

struct WrapDefaults {
    inner: DeepDefaults;
}

contract DefaultsNested {
    f: WrapDefaults;

    init() {
        self.f = WrapDefaults{ inner: DeepDefaults{} };
    }
}