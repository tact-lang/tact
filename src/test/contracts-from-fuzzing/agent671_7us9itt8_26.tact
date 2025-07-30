struct OptionalString {
    id: Int;
    name: String?;
}

contract TestContract {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            id: 7,
            name: null
        };
    }
}