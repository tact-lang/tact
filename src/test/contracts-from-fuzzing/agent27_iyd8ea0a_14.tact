struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStruct {
    inner: OptionalFields;

    init() {
        self.inner = OptionalFields{
            a: null,
            b: null,
            c: null
        };
    }
}