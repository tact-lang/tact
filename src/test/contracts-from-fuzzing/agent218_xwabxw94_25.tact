struct Combo {
    i: Int = 3;
    b: Bool = true;
    s: String = "テスト";
}

contract UnicodeCombo {
    c: Combo;

    init() {
        self.c = Combo{};
    }
}