struct NestedDefaults {
    num: Int = 1;
    inner: InnerDefaults;
}

struct InnerDefaults {
    flag: Bool = false;
    s: String = "x";
}

contract DeepDefaults {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: InnerDefaults{}
        };
    }
}