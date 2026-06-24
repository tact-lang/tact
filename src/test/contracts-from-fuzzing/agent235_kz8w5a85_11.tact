struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract ComboFields {
    first: Int;
    second: Bool?;
    third: Combo;

    init() {
        self.first = 1;
        self.second = null;
        self.third = Combo{ a: 7, b: false, c: null, d: true };
    }
}