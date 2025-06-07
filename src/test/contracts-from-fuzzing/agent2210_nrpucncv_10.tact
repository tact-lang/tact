struct Defaulted {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;
    d: Int? = null;
    e: Bool? = null;
}

contract DefaultValues {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}