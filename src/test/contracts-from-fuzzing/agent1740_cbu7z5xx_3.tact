struct DeepOptional {
    prop1: Int?;
    prop2: Bool?;
    prop3: String?;
}

contract OptionalFields {
    info: DeepOptional;

    init() {
        self.info = DeepOptional {
            prop1: null,
            prop2: true,
            prop3: "hello"
        };
    }
}