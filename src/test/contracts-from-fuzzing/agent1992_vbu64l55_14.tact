struct Inner {
    foo: Int = 11;
}

struct Outer {
    nested: Inner = Inner{};
    optVal: Int?;
}

contract Test {
    optOuter: Outer?;

    init() {
        self.optOuter = null;
    }
}