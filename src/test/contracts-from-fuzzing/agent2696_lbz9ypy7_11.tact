struct InnerDefaults {
    d: Int = 7;
    e: String = "default";
}

struct NestedDefaults {
    a: Int = 42;
    b: String = "hi";
    c: Bool = true;
    inner: InnerDefaults = InnerDefaults{};
}

contract DefaultsTest {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}