struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    name: String?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            foo: null,
            bar: true,
            name: null
        };
    }
}