struct OptionalString {
    value: String?;
}

contract TopOpt {
    a: OptionalString?;

    init() {
        self.a = null;
    }
}