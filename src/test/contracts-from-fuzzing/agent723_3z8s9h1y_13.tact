struct Defaulted {
    a: Int = 3;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
}

contract TestContract {
    f: Defaulted;

    init() {
        self.f = Defaulted{};
    }
}