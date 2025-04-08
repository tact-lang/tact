struct OptionalStringStruct {
    name: String?;
    description: String?;
    note: String?;
    comment: String?;
}

contract OptStringContract {
    info: OptionalStringStruct;

    init() {
        self.info = OptionalStringStruct{
            name: null,
            description: null,
            note: null,
            comment: null,
        };
    }
}
