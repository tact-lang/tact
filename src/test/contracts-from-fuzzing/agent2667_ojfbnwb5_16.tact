struct StringFields {
    name: String;
    greeting: String;
}

contract StringStructFields {
    data: StringFields;
    init() {
        self.data = StringFields{name: "Alice", greeting: "Hello"};
    }
    receive() {
        self.data = StringFields{name: "Bob", greeting: "Hi"};
    }
}