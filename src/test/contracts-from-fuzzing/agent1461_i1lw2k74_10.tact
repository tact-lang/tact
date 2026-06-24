struct OptionalNested {
    n: Int?;
    s: String?;
    b: Bool?;
}

contract OptNested {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ n: null, s: null, b: null };
    }
}