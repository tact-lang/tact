struct Defaulted {
    g: Int = 8;
    h: Bool = true;
    s: String = "abc";
}

contract WrapAndDefault {
    nested: Defaulted;

    init() {
        self.nested = Defaulted{};
    }
}