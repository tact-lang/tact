struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: null,
            c: null
        };
    }
}