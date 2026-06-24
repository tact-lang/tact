struct OptionalStringWrap {
    s: String?;
}

struct OuterWrap {
    nested: OptionalStringWrap?;
    val: Int;
}

contract OptionalNestedWrapContract {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            nested: OptionalStringWrap{ s: null },
            val: 42,
        };
    }
}
