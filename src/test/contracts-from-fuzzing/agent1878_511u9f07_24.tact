struct OptionalOnly {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
}

contract Test {
    val: OptionalOnly;

    init() {
        self.val = OptionalOnly{};
    }
}