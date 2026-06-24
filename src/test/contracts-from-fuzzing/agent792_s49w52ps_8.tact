struct InnerMost {
    foo: Int;
}

struct Inner {
    nested: InnerMost?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    val: Outer?;

    init() {
        self.val = null;
    }
}