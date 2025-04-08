struct MixNestedDefaults {
    x: Int = 0;
    y: Inner? = null;
}

struct Inner {
    foo: Int = 7;
    bar: Bool? = true;
}

contract MixNestedDefaultsContract {
    s: MixNestedDefaults;

    init() {
        self.s = MixNestedDefaults{};
    }
}
