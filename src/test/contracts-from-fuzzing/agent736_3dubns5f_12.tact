struct NestedWithDefaults {
    x: Int = 1;
    y: Bool = true;
}

struct OuterWithEmbeddedDefaults {
    inner: NestedWithDefaults;
    s: String = "default";
    flag: Bool;
}

contract DefaultsPropagationTest {
    f: OuterWithEmbeddedDefaults;

    init() {
        self.f = OuterWithEmbeddedDefaults{ inner: NestedWithDefaults{}, flag: false };
    }
}