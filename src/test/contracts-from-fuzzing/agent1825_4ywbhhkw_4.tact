struct DeepOptional {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract OptStorage {
    values: DeepOptional;
    init() {
        self.values = DeepOptional{
            field1: null,
            field2: true,
            field3: null,
        };
    }
}
