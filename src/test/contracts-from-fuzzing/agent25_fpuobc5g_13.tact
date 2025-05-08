// edge: optional struct field with inner optional
struct InnerMost {
    value: Int;
}

struct Inner {
    nested: InnerMost?;
}

contract Test {
    maybeInner: Inner?;
    init() {
        self.maybeInner = Inner{
            nested: null
        };
    }
}