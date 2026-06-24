struct Defaulted {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract UseDefaults {
    x: Defaulted;
    init() {
        self.x = Defaulted{};
    }
}