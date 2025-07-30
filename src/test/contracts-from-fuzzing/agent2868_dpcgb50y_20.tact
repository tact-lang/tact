struct InlineNested {
    inner: InlineInner;
}

struct InlineInner {
    val: Int;
}

contract InlineNestedStorage {
    nested: InlineNested = InlineNested{ inner: InlineInner{ val: 42 } };
}