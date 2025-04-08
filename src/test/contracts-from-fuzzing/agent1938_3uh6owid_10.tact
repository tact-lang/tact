struct NestedDefaults {
    foo: Int = 12;
    bar: Bool = true;
    baz: String = "abc";
}

contract NestedDefaultsTest {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}