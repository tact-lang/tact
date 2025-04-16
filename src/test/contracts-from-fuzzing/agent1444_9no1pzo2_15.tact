struct Leaf {
    foo: Int;
}

struct Inner {
    leaf: Leaf?;
}

contract OptionalWrapper {
    field: Inner?;

    init() {
        self.field = null;
    }
}
