struct DefaultStrings {
    a: String = "hello";
    b: String = "world";
}

contract DefaultStrHolder {
    s: DefaultStrings;

    init() {
        self.s = DefaultStrings{};
    }
}