struct OptionalNested {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract OptionalNestedContract {
    data: OptionalNested = OptionalNested{ i: null, s: null, b: null };

    init() {
        self.data = OptionalNested{ i: 1, s: "hi", b: true };
    }
}