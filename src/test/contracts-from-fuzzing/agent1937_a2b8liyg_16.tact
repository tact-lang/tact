// focuses on presence of nested optional struct field
struct OptInner {
    value: Int;
}

struct Container {
    inner: OptInner?;
}

contract OptionalNestedStruct {
    obj: Container;

    init() {
        self.obj = Container{ inner: null };
    }
}
