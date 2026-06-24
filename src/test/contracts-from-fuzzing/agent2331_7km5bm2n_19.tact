struct Defaulted {
    a: Int = 1;
    b: String = "test";
    c: Bool = false;
}

contract Test {
    def: Defaulted;
    init() {
        self.def = Defaulted{};
    }
}