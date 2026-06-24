struct DefaultStr {
    t: String = "x";
}

contract DefStrField {
    d: DefaultStr;

    init() {
        self.d = DefaultStr{};
    }
}