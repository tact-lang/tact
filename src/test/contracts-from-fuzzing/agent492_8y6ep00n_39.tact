struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner?;
}

contract Foo {
    nested: Middle?;

    init() {
        self.nested = null;
    }
}