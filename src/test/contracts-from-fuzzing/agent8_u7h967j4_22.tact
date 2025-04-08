struct Defaulted {
    foo: Int = 1;
    bar: Bool = false;
}

contract UseDefaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}