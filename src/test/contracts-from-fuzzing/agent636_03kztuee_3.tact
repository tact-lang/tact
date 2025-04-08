struct Inner {
    value: Int;
}

struct Middle {
    nested: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNestedStruct {
    info: Outer;

    init() {
        self.info = Outer{ middle: Middle{ nested: Inner{ value: 7 } } };
    }
}
