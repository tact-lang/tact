struct Base {
    x: Int;
}

struct Wrapper {
    inner: Base;
    maybeInner: Base?;
}

contract NestedOptionals {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            inner: Base{x:1},
            maybeInner: null,
        };
    }
}