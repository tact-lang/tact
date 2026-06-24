struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
}

contract StructDefaults {
    x: Defaulted;

    init() {
        self.x = Defaulted{};
    }
}