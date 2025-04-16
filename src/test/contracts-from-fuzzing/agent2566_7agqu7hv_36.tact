struct OptionalCombined {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptCombo {
    val: OptionalCombined;

    init() {
        self.val = OptionalCombined{one: null, two: null, three: null};
    }
}
