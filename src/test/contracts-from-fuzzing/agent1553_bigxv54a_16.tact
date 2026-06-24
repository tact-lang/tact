struct HasString {
    s: String = "Hello, world!";
}

contract HasStr {
    data: HasString;

    init() {
        self.data = HasString{};
    }
}