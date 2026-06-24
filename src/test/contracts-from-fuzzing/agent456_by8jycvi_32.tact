struct OptionalString {
    txt: String?;
}

contract OptionalStringField {
    sf: OptionalString;

    init() {
        self.sf = OptionalString{ txt: null };
    }
}