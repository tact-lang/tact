// contract field is an optional struct containing an optional field
struct Inner {
    s: String?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptionals {
    data: Outer?;
    init() {
        self.data = null;
    }
}