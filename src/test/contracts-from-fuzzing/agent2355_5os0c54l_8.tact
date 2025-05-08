struct DeepDefaults {
    x: Int = 1;
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    y: Int = 2;
    z: String = "ok";
}

contract ComplexDefaults {
    d: DeepDefaults;

    init() {
        self.d = DeepDefaults{
            inner: InnerWithDefaults{}
        };
    }
}