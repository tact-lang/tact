struct DeepDefaults {
    a: Int = 1;
    nested: InnerDefaults;
}

struct InnerDefaults {
    b: Bool = false;
    c: String = "inside";
}

contract DeepDefContract {
    dd: DeepDefaults;

    init() {
        self.dd = DeepDefaults{
            nested: InnerDefaults{}
        };
    }
}
