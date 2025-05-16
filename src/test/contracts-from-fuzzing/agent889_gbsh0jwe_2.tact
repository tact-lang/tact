struct NestedOptionals {
    first: Int?;
    second: Bool?;
    nested: Inner?;
}

struct Inner {
    val: Int?;
}

contract UsesNestedOptionals {
    opts: NestedOptionals;

    init() {
        self.opts = NestedOptionals{
            first: null,
            second: null,
            nested: null,
        };
    }
}