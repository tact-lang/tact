struct OptionalFields {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract OptionStructHolder {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            maybeInt: null,
            maybeBool: true,
            maybeString: null
        };
    }
}
