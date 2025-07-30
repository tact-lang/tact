struct OptString {
    s: String?;
}

contract OptionalStringPersist {
    persisted: OptString;

    init() {
        self.persisted = OptString{ s: null };
    }
}