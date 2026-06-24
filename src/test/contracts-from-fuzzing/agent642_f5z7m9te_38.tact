// Optional + default on nested structs' optionals
struct Inner {
    foo: Int? = null;
    bar: Bool? = null;
}

struct Outer {
    nested: Inner? = null;
}

contract NestedOptDef {
    state: Outer?;

    init() {
        self.state = null;
    }
}