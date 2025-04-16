struct OptionalStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            s: null,
            b: true,
            i: null,
        };
    }
}