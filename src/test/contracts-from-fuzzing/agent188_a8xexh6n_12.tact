struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    nested: Middle;
}

contract OptionalNested {
    item: Outer?;
    init() {
        self.item = null;
    }
}