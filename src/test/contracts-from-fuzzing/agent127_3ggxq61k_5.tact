struct Inner {
    val: Int?;
}

struct Outer {
    left: Inner;
    right: Inner;
}

contract NestedMultipleOptionals {
    nested: Outer;

    init() {
        self.nested = Outer{
            left: Inner{ val: null },
            right: Inner{ val: 42 }
        };
    }
}