struct StructWithDefaults {
    foo: Int = 10;
    bar: Bool = false;
    baz: String = "xyz";
}

contract DefaultsTest {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}