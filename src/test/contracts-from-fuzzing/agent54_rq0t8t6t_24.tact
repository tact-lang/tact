struct NestedDefaults {
    inner: InnerWithDefaults;
}

struct InnerWithDefaults {
    foo: Int = 8;
    bar: Bool? = null;
}

contract NestedDefaultsContract {
    storage: NestedDefaults;

    init() {
        self.storage = NestedDefaults{
            inner: InnerWithDefaults{}
        };
    }
}