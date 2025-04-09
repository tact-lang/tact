struct OptionalString {
    val: String?;
}

contract WithOptionalString {
    f: OptionalString;

    init() {
        self.f = OptionalString{ val: null };
    }
}