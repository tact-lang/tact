struct OptDeep {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructFields {
    field1: OptDeep;
    field2: OptDeep;
    init() {
        self.field1 = OptDeep{a: null, b: true, c: null};
        self.field2 = OptDeep{a: 123, b: null, c: "hello"};
    }
}