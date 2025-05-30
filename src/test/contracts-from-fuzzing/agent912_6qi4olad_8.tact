struct DefaultsOptional {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = true;
}

contract DefaultsOptionalTest {
    field: DefaultsOptional;

    init() {
        self.field = DefaultsOptional{};
    }
}