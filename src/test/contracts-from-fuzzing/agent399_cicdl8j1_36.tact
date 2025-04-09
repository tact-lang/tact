struct NestedPrimitiveDefaults {
    x: Int = 1;
    y: Bool = true;
    s: String = "nested";
}

contract NestedPrimitiveDefaultsTest {
    f: NestedPrimitiveDefaults;

    init() {
        self.f = NestedPrimitiveDefaults{};
    }
}