struct NestedDefaults {
    a: Int = 1;
}

struct WrapNestedDef {
    nested: NestedDefaults;
}

contract WrapDefaultsTest {
    data: WrapNestedDef = WrapNestedDef{ nested: NestedDefaults{} };
}