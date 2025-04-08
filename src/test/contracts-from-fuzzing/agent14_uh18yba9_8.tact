struct Child {
    foo: Int;
    bar: Bool?;
}

struct Parent {
    ch: Child?;
    baz: Int;
}

contract OptionalStructWithOptionalField {
    data: Parent;

    init() {
        self.data = Parent{
            ch: null,
            baz: 10,
        };
    }
}