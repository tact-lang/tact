struct NestedEmptyOpt {
    foo: Inner?;
}

struct Inner {
    bar: Int?;
}

contract NullDeepInit {
    val: NestedEmptyOpt;

    init() {
        self.val = NestedEmptyOpt{
            foo: null,
        };
    }
}