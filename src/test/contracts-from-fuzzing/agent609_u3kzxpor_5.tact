struct OptionalNest {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract OptNested {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{ i: null, s: null, b: null };
    }
}