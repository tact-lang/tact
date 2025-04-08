// Nested optionals edge: outer optional struct containing inner optional primitive
struct Inner {
    foo: Int?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptOpt {
    val: Outer;

    init() {
        self.val = Outer{
            inner: null
        };
    }
}