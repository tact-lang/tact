struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    comment: String?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: null,
            comment: null,
        };
    }
}