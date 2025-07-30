struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
}

contract DefaultVals {
    f: Defaulted;
    init() {
        self.f = Defaulted{};
    }
}