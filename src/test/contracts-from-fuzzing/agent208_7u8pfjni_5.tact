struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract Test6 {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            foo: null,
            bar: true,
            text: null,
        };
    }
}