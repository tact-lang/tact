struct FullyOptional {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Address?;
    five: Cell?;
}

contract OptTest {
    storage: FullyOptional?;

    init() {
        self.storage = null;
    }
}