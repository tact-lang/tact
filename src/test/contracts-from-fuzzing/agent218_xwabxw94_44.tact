struct Inner {
    foo: Int;
    remains: Slice as remaining;
}

struct Outer {
    bar: Int;
    nested: Inner;
    baz: Int;
}

contract NestedRemainPosition {
    field: Outer;

    init() {
        self.field = Outer{
            bar: 1,
            nested: Inner{ foo: 2, remains: emptyCell().asSlice() },
            baz: 3
        };
    }
}