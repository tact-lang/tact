struct OptionalString {
    name: String?;
    age: Int;
}

contract TestContract {
    info: OptionalString;

    init() {
        self.info = OptionalString{
            name: null,
            age: 25
        };
    }
}