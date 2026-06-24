struct OnlyDefaults {
    a: Int = 5;
    b: String = "def";
    c: Bool = true;
}

contract Test {
    d: OnlyDefaults;

    init() {
        self.d = OnlyDefaults{
            a: 2,
            b: "ghi",
            c: false
        };
    }
}
