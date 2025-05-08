// Contract with optional nested struct, but set inner to non-null outer null
struct Inner {
    f: Int;
}

struct Outer {
    inner: Inner?;
}

contract OptionalOuterNull {
    data: Outer?;
    init() {
        self.data = null;
    }
}