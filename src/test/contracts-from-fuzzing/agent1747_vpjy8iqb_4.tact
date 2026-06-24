struct OptionalNested {
    info: String;
    maybeNumber: Int?;
}

contract OptionalStructStorage {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ info: "hello", maybeNumber: null };
    }
}