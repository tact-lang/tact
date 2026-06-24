struct Defaulted {
    a: Address? = null;
}

contract OptDefaults2 {
    st: Defaulted;

    init() {
        self.st = Defaulted{};
    }
}