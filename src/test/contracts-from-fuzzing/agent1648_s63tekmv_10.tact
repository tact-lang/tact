struct HasString {
    text: String;
    number: Int;
}

contract TestContract {
    field: HasString;

    init() {
        self.field = HasString {
            text: "hello",
            number: 42
        };
    }
}