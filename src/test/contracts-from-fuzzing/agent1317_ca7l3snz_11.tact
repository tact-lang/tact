struct OptionalString {
    val: String?;
}

contract OptionalStringPersist {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            val: "hello"
        };
    }
}