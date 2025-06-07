struct NestedDefaults {
    a: Int = 111;
    b: Bool = false;
}

struct Top {
    inner: NestedDefaults = NestedDefaults{};
    c: String = "abc";
}

contract NestedDefaultsContract {
    f: Top;

    init() {
        self.f = Top{};
    }
}