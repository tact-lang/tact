struct Inner {
    a: Int;
    b: Bool?;
    c: Slice;
}

struct Outer {
    nested: Inner;
    num: Int;
}

contract DeeplyNestedOptionalTest {
    field: Outer;

    init() {
        self.field = Outer{
            nested: Inner{
                a: 7,
                b: null,
                c: emptyCell().asSlice(),
            },
            num: 42,
        };
    }

    receive() {}
}