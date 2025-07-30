struct DefaultNested {
    a: Int = 1;
    b: Bool = false;
}

contract UseDefaultNested {
    d: DefaultNested;
    init() {
        self.d = DefaultNested{};
    }
}