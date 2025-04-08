struct DefaultString {
    s: String = "default";
}

contract DefStringField {
    f: DefaultString;

    init() {
        self.f = DefaultString{};
    }
}
