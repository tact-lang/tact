struct NestedInner {
    a: Int;
    b: Bool;
    s: String;
}

struct NestedOuter {
    inner: NestedInner;
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract TestContract {
    store: NestedOuter;

    init() {
        self.store = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: true,
                s: "test",
            },
            intVal: 42,
            boolVal: false,
            strVal: "outer",
        };
    }
}