struct DefaultNullable {
    foo: Int? = null;
    bar: String? = null;
}

contract InitNullableDefaults {
    f: DefaultNullable;

    init() {
        self.f = DefaultNullable{};
    }
}