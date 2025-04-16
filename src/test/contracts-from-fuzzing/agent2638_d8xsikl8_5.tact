struct OptionalNest {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

contract OptionalCombo {
    data: OptionalNest?;

    init() {
        self.data = OptionalNest{
            opt1: 5,
            opt2: null,
            opt3: "test",
            opt4: null,
        };
    }
}