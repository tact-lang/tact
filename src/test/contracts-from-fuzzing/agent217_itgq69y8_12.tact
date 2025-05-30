struct FullyOptional {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructInOptional {
    content: FullyOptional? = null;

    init() {
        self.content = null;
    }
}