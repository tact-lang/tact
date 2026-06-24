struct OptionalFields {
    a: Int?; 
    b: Bool?;
    c: String?;
}

contract TestOptional {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: "hello"
        };
    }
}
