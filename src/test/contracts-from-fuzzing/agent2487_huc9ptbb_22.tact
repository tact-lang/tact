struct Defaulted {
    n: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract TestContract {
    def: Defaulted;

    init() {
        self.def = Defaulted{};
    }
}