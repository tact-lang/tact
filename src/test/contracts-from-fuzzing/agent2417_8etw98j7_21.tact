struct OptionalNested {
    wrapped: Int?;
}

struct OuterMost {
    nested: OptionalNested?;
}

contract OptOptLayer {
    val: OuterMost;

    init() {
        self.val = OuterMost{ nested: OptionalNested{ wrapped: 123 } };
    }
}
