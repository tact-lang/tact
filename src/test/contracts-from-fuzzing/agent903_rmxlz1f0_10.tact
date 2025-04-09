struct OptionalString {
    val: String?;
}

contract OptionalStringPersist {
    strField: OptionalString;

    init() {
        self.strField = OptionalString{ val: null };
    }
}