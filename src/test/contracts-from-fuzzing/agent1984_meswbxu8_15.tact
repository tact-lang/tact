struct NestedOptional {
    inner: OptionalChild?;
}

struct OptionalChild {
    foo: Int;
    bar: Bool?;
}

contract OptsInside {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            inner: OptionalChild{
                foo: 1,
                bar: null,
            }
        };
    }
}