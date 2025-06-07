struct NestedOptional {
    foo: Int?;
    nested: Inner?;
}

struct Inner {
    bar: Bool?;
}

contract NestedOptStructs {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            foo: null,
            nested: Inner{ bar: null }
        };
    }
}