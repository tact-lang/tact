// Nested struct in contract persistent state field with optional field default null
struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner;
}

contract NestedOptNull {
    field: Outer;

    init() {
        self.field = Outer{
            inner: Inner{ x: null }
        };
    }
}