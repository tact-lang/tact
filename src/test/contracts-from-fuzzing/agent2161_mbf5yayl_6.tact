// contract holding a struct with optional fields
struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptFieldsHolder {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: null,
            c: null,
        };
    }
}