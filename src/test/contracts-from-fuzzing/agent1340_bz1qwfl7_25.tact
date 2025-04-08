struct VariantDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "foo";
    d: Bool = false;
    e: Int?;
}

contract FieldDefaultsTest {
    data: VariantDefaults;

    init() {
        self.data = VariantDefaults{
            b: true,
            e: null,
        };
    }
}