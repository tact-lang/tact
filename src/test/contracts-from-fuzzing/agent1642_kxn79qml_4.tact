struct DefaultsOptional {
    name: String = "Alice";
    flag: Bool?;
}

contract OptionalDefaults {
    data: DefaultsOptional;

    init() {
        self.data = DefaultsOptional{};
    }
}