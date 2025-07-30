struct OptionalStruct {
    id: Int?;
    message: String?;
    flag: Bool?;
}

contract OptionalFields {
    opt1: OptionalStruct;

    init() {
        self.opt1 = OptionalStruct{
            id: null,
            message: null,
            flag: null
        };
    }
}