struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    optOuter: Outer?;

    init() {
        self.optOuter = null;
    }
}