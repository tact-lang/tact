struct OptionalStruct {
    innerVal: Int?;
    flag: Bool?;
    name: String?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            innerVal: null,
            flag: true,
            name: null,
        };
    }
}