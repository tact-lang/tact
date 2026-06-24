struct InnerNested {
    innerVal: Int;
}

struct OuterNested {
    nested: InnerNested;
}

contract OptionalStructField {
    val: OuterNested?;

    init() {
        self.val = null;
    }
}