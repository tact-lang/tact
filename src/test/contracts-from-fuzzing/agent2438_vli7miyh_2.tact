struct InnerMost {
    value: Int;
}

struct Middle {
    optionalInnerMost: InnerMost?;
}

struct Outer {
    middle: Middle;
}

contract NestedOptionals {
    nestedField: Outer;

    init() {
        self.nestedField = Outer{ middle: Middle{ optionalInnerMost: null } };
    }
}
