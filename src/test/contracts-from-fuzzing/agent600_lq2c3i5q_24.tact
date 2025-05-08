// Nested optional cross boundary
struct Inner {
    foo: Bool;
}

struct Middle {
    nested: Inner?;
}

contract NestedOptMid {
    m: Middle?;

    init() {
        self.m = null;
    }
}