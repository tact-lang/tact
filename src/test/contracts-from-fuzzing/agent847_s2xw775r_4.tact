struct DefaultOptionStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsDefaults {
    data: DefaultOptionStruct;

    init() {
        self.data = DefaultOptionStruct{};
    }
}