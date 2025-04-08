struct HasString {
    name: String;
    greeting: String;
    emoji: String;
}

contract MultiString {
    data: HasString;

    init() {
        self.data = HasString{
            name: "Alice",
            greeting: "Hello",
            emoji: "😊",
        };
    }
}