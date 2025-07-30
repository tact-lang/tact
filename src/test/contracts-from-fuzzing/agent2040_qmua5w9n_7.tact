struct DefaultsOptional {
    name: String = "test";
    age: Int?; // default to null
}

contract OptionalDefault {
    data: DefaultsOptional;

    init() {
        self.data = DefaultsOptional{ };
    }
}
