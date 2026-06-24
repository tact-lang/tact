struct Defaulted {
    val1: Int = 10;
    val2: Bool = true;
}

contract TestContract {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}
