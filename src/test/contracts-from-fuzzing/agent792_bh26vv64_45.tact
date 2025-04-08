struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner? = null;
}

contract TestC {
    outerOpt: Outer?;

    init() {
        self.outerOpt = Outer{};
    }
}