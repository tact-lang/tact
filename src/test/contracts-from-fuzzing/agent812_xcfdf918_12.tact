struct NestedDefaults {
    a: SDefault;
    b: SDefault;
}

struct SDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
}

contract NestedDefaultsTest {
    field: NestedDefaults;

    init() {
        self.field = NestedDefaults{a: SDefault{}, b: SDefault{}};
    }
}