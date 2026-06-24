struct OptionalStruct {
    a: Int;
    b: String?;
    c: Int?;
    d: Bool?;
}

contract HasOptionalStruct {
    state: OptionalStruct;

    init() {
        self.state = OptionalStruct{
            a: 42,
            b: null,
            c: null,
            d: null,
        };
    }
}