struct OptionalStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract OptionalFields {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            opt1: null,
            opt2: true,
            opt3: null
        };
    }
}