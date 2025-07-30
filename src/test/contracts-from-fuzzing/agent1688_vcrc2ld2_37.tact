struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract TestContract {
    dat: Defaulted;

    init() {
        self.dat = Defaulted{};
    }
}