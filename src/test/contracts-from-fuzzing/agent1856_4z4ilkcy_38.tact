struct BigDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
}

contract DefaultsCombo {
    x: Int;
    y: BigDefault;

    init() {
        self.x = 7;
        self.y = BigDefault{};
    }
}
