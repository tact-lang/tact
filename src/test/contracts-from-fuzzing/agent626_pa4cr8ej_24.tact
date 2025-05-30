struct NestedEmptyOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    s: String?;
}

contract EmptyInnerNull {
    nested: NestedEmptyOpt;

    init() {
        self.nested = NestedEmptyOpt{ inner: null };
    }
}