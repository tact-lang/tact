struct ExplicitDefaults {
    foo: Int = 123;
    bar: Bool = false;
    baz: String = "yo";
}

contract DefaultsTest {
    data: ExplicitDefaults;
    init() {
        self.data = ExplicitDefaults{};
    }
}