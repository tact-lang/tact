struct DefaultString {
    s: String = "Hello World";
}

contract TestDefaultString {
    x: DefaultString;
    init() {
        self.x = DefaultString{};
    }
}