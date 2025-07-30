struct OptionalString {
    name: String?;
    other: String?;
}

contract TestContract {
    val: OptionalString;

    init() {
        self.val = OptionalString{
            name: null,
            other: "hello",
        };
    }
}