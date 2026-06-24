struct OptionalFieldsStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsContract {
    data: OptionalFieldsStruct;

    init() {
        self.data = OptionalFieldsStruct{
            a: null,
            b: true,
            c: null
        };
    }
}