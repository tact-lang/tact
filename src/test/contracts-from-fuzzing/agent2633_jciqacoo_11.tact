struct InnerDefaults {
    a: Int = 5;
    b: String = "foo";
    c: Bool = true;
}

struct OuterDefaults {
    inner: InnerDefaults = InnerDefaults{};
    flag: Bool = false;
}

contract DefaultsStorage {
    store: OuterDefaults;

    init() {
        self.store = OuterDefaults{};
    }
}
