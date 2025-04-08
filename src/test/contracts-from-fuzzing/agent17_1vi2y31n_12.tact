struct OptionalString {
    val: String?;
}

contract TopLevelOpt {
    f: OptionalString;

    init() {
        self.f = OptionalString{ val: null };
    }
}