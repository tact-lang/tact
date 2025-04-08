struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract DefaultFields {
    f: Defaulted;

    init() {
        self.f = Defaulted{};
    }
}