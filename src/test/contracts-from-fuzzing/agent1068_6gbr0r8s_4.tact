struct Outer {
    nested1: Inner;
    nested2: InnerOptional;
}

struct Inner {
    value: Int;
}

struct InnerOptional {
    value: Int?;
}

contract NestedOptionals {
    store: Outer;

    init() {
        self.store = Outer{
            nested1: Inner{ value: 7 },
            nested2: InnerOptional{ value: null },
        };
    }
}