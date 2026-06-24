struct Defaulted {
    a: Int = 42;
    b: Bool = true;
}

contract DefaultFields {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
