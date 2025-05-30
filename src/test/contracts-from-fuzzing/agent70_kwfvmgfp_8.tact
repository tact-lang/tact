struct InnerMost {
    val: Int;
}

struct Wrapper {
    maybe: InnerMost?;
}

struct Outer {
    nested: Wrapper;
}

contract TestContract {
    deepOption: Outer;

    init() {
        self.deepOption = Outer{ nested: Wrapper{ maybe: null } };
    }

    receive() {
        self.deepOption = Outer{ nested: Wrapper{ maybe: InnerMost{ val: 123 } } };
    }
}