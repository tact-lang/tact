struct Combo {
    value: Int = 0;
    flag: Bool? = null;
    text: String = "";
}

contract ComboDefaults {
    combined: Combo;

    init() {
        self.combined = Combo{
            value: 5,
            flag: true,
            text: "hello"
        };
    }
}
