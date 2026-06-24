struct OptionalInStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract MultiOptFields {
    field: OptionalInStruct;

    init() {
        self.field = OptionalInStruct{
            s: null,
            b: true,
            i: null
        };
    }
}