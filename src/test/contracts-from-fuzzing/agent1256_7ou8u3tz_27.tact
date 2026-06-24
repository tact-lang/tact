struct FullOfDefaults {
    a: Int = 5;
    b: Bool?;
    c: String = "x";
}

contract EmptyInitAssign {
    s: FullOfDefaults;

    init() {
        self.s = FullOfDefaults{};
    }
}