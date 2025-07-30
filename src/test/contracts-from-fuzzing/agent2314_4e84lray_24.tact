struct Defaulted {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";
}

contract TestDefaultsOmittedInit {
    f: Defaulted;
    init() {
        self.f = Defaulted{};
    }
}