struct OptionalStruct {
    name: String;
    comment: String?;
    flag: Bool?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            name: "hi",
            comment: null,
            flag: true
        };
    }
}