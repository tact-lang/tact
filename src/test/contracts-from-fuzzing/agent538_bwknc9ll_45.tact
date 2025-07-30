struct Defaulted {
    x: Int = 99;
}

contract AssignDefaultExplicit {
    d: Defaulted;
    init() {
        self.d = Defaulted{};
    }
}