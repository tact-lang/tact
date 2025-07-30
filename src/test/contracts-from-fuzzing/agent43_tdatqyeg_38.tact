struct OptionalWithNestedDefaults {
    a: Int?;
    b: Bool?;
}

struct OptionalContainer {
    inner: OptionalWithNestedDefaults?;
}

contract WithOptionalDefaults {
    val: OptionalContainer;

    init() {
        self.val = OptionalContainer{ inner: null };
    }
}