struct OptionalNested {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalNestedContract {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ a: null, b: null, c: null };
    }
}