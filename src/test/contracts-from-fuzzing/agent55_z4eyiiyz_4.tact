struct OptStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NullableFields {
    os: OptStruct;

    init() {
        self.os = OptStruct{
            a: null,
            b: null,
            c: null
        };
    }
}
