struct Defaulted {
    a: Int? = null;
    b: Bool? = null;
}

contract UseDefaulted {
    f: Defaulted;

    init() {
        self.f = Defaulted{};
    }
}