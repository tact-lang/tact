struct OptionalString {
    name: String?;
}

contract NullString {
    rec: OptionalString;

    init() {
        self.rec = OptionalString{name: null};
    }
}
