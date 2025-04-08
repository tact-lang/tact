struct ManyOptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract AllOptionalPrimitives {
    vals: ManyOptionalPrimitives;
    init() {
        self.vals = ManyOptionalPrimitives{ i: null, b: null, s: null };
    }
}