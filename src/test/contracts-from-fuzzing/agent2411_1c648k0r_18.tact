struct OptionalString {
    data: String?;
}

contract OptStringField {
    opt: OptionalString;

    init() {
        self.opt = OptionalString{
            data: null
        };
    }
}