struct OptionalString {
    val: String?;
}

contract OptionalStringStorage {
    name: OptionalString;

    init() {
        self.name = OptionalString{
            val: null
        };
    }
}