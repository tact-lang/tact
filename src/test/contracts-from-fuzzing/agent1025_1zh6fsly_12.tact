struct Defaulted {
    foo: Int = 7;
    bar: Bool = true;
    text: String = "hi";
}

contract AllDefaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}
