struct OptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: "test",
            c: true
        };
    }
}