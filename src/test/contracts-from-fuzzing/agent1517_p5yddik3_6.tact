struct Inner {
    n: Int;
}

struct Outer {
    innerOpt: Inner?;
}

contract Test {
    outerOpt: Outer?;

    init() {
        self.outerOpt = null;
    }

    receive() {}
}