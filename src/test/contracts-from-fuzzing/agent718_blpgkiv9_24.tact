struct InlineOptional {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract InlineOptionalContract {
    val: InlineOptional;
    init() {
        self.val = InlineOptional{ a: null, b: null, c: null };
    }
}