struct Defaulted {
    f1: Int = 5;
    f2: Bool = false;
}

contract TestContract {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}