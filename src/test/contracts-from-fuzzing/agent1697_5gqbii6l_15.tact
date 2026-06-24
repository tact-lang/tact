struct Defaulted {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
}

contract TestContract {
    d: Defaulted;
    init() {
        self.d = Defaulted{};
    }
}