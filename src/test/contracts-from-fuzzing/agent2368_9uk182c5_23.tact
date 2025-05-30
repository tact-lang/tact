struct OptionalContainer {
    val: Int?;
    text: String?;
}

contract NullDefaults {
    container: OptionalContainer;

    init() {
        self.container = OptionalContainer{ val: null, text: null };
    }
}