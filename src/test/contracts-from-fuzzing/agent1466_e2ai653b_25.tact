struct AllOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract AllOptTest {
    field: AllOptional = AllOptional{ a: null, b: null, c: null, d: null };

    init() {
        self.field = AllOptional{ a: 1, b: true, c: "hi", d: null };
    }
}
