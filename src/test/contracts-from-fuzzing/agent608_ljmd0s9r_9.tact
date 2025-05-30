struct OptionalNested {
    inside: Int?;
}

contract OptionalPersist {
    s: OptionalNested?;

    init() {
        self.s = null;
    }
}
