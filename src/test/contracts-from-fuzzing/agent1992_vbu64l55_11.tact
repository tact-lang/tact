struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    outerOpt: Outer?;

    init() {
        self.outerOpt = null;
    }
}