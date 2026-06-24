struct OptionalNested {
    nested: Int?;
    s: String?;
    b: Bool?;
}

contract Test {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ nested: null, s: null, b: null };
    }
}