// Struct with optional nested struct field
struct Inner {
    num: Int;
}

struct Container {
    maybeInner: Inner?;
}

contract OptNestedStruct {
    val: Container;

    init() {
        self.val = Container{ maybeInner: null };
    }
}