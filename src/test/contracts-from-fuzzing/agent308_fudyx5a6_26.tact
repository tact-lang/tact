struct DeepDefaults {
    inner: InnerDefaults;
}

struct InnerDefaults {
    big: Int = 999;
    word: String = "hi";
    flag: Bool = true;
}

contract NestedDefaults {
    val: DeepDefaults;

    init() {
        self.val = DeepDefaults{
            inner: InnerDefaults {}
        };
    }
}
