struct OptionalInStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalStructField {
    field: OptionalInStruct;

    init() {
        self.field = OptionalInStruct{
            a: null,
            b: "hello",
            c: true,
        };
    }
}
