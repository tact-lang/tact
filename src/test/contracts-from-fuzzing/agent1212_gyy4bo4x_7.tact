struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultValues {
    v: Defaulted;

    init() {
        self.v = Defaulted{};
    }
}