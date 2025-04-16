struct OptionalStruct {
    text: String?;
    count: Int?;
    flag: Bool?;
}

contract MultiOptional {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            text: null,
            count: 123,
            flag: null
        };
    }
}
