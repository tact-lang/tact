struct Middle {
    x: Int;
}

struct Outer {
    inner: Middle;
}

contract TestContract {
    nested: Outer?;

    init() {
        self.nested = null;
    }
}