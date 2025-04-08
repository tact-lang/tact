struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
}

contract DefaultsInStruct {
    s: Defaulted;
    init() {
        self.s = Defaulted{};
    }
}
