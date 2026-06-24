struct OptionalNesting {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptNestTest {
    data: OptionalNesting?;

    init() {
        self.data = null;
    }
}
