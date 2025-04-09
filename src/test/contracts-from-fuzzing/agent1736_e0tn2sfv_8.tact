struct OptionalString {
    name: String?;
    flag: Bool;
}

contract OptStringField {
    os: OptionalString;
    init() {
        self.os = OptionalString{
            name: null,
            flag: true
        };
    }
}