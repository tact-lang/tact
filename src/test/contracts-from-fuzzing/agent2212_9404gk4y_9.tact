struct InnerMost {
    y: Int;
}

struct Inner {
    deepOpt: InnerMost?;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{deepOpt: InnerMost{y:77}};
    }
}
