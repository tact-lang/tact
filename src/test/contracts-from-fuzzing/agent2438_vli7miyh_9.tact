struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner;
}

contract OptionalStruct {
    maybeOuter: Outer?;

    init() {
        self.maybeOuter = null;
    }
}
