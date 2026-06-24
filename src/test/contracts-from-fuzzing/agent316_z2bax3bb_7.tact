struct Inner {
    value: Int;
}

struct Outer {
    maybeInner: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            maybeInner: null
        };
    }
}
