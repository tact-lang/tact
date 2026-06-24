struct Defaulted {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsInFields {
    state: Defaulted;

    init() {
        self.state = Defaulted{};
    }
}
