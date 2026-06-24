struct InnerInt {x: Int}

struct Middle {inner: InnerInt}

struct Outer {middle: Middle}

contract OptionalOuter {
    field: Outer?;

    init() {
        self.field = null;
    }
}