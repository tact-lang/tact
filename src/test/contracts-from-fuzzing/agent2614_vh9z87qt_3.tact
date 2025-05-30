struct DeepOptional {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalFieldsStorage {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            val: null,
            flag: true,
            text: null
        };
    }
}