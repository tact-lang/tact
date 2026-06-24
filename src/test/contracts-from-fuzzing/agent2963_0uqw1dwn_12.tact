// Multiple optionals in a struct, plus contract optional
struct Combo {
    id: Int?;
    name: String?;
    flag: Bool?;
}

contract OptionalsCombo {
    optCombo: Combo?;

    init() {
        self.optCombo = Combo{
            id: 1,
            name: "test",
            flag: null
        };
    }
}
