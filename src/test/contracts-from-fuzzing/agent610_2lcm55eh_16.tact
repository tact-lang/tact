// Test optionals of nested structs with defaults
struct Inner {
    x: Int = 7;
    y: Bool? = null;
}

struct Outer {
    inner: Inner?;
}

contract OptNestedDefault {
    s: Outer;

    init() {
        self.s = Outer{ inner: null };
    }
}