struct DefaultString {
    s: String = "hello world";
}

contract DefaultsString {
    x: DefaultString;

    init() {
        self.x = DefaultString{};
    }
}