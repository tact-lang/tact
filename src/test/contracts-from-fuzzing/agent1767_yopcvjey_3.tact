struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            a: null,
            b: true,
            c: null
        };
    }
}
