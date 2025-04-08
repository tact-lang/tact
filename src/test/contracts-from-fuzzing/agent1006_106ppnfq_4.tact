struct OptionalNestedLevel {
    info: Int?;
    extra: Bool?;
}

contract TestContract {
    data: OptionalNestedLevel;

    init() {
        self.data = OptionalNestedLevel{ info: null, extra: true };
    }
}
