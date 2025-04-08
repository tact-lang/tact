struct Defaulted {
    i: Int = 5;
    b: Bool = true;
    s: String = "abc";
}

contract DefaultStructFields {
    def: Defaulted;
    init() {
        self.def = Defaulted{};
    }
}