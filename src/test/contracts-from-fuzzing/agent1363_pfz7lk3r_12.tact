struct NestedDefaults {
    inner: InnerDefault;
}

struct InnerDefault {
    foo: Int = 42;
    bar: Bool?;    // implicitly null
}

contract NestedDefaultsStorage {
    storage: NestedDefaults;

    init() {
        self.storage = NestedDefaults{
            inner: InnerDefault{},
        };
    }
}