struct DefaultString {
    foo: String = "default";
}

contract DefaultStringUse {
    d: DefaultString;

    init() {
        self.d = DefaultString{};
    }
}