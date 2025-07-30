struct Inner {
    val: Int;
}

struct Outer {
    val: Int;
    nested: Inner;
}

contract OptionalNestedStruct {
    optionalOuter: Outer? = null;

    init() {
        self.optionalOuter = null;
    }
}