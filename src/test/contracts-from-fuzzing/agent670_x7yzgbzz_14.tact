struct NestedWithDefaults {
    p: Int = 5;
    q: Bool? = null;
}

struct UsesNested {
    inner: NestedWithDefaults;
    x: Int;
}

contract NestedDefaults {
    val: UsesNested;

    init() {
        self.val = UsesNested{
            inner: NestedWithDefaults{},
            x: 42,
        };
    }
}