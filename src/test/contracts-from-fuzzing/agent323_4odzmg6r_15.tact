struct OptionalHeavy {
    one: Int?;
    two: Bool?;
    three: Address?;
    four: String?;
    five: Cell?;
    six: Slice?;
    seven: Builder?;
}

contract Test {
    data: OptionalHeavy;

    init() {
        self.data = OptionalHeavy{};
    }
}