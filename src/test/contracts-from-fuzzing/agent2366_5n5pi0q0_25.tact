struct OptionalString {
    s: String?;
}

contract OptionalStringField {
    f: OptionalString;

    init() {
        self.f = OptionalString{s:null};
    }
}