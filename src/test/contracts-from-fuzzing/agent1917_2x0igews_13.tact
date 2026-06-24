struct DeepOpt {
    inner: Int?;
}

struct DeepMid {
    nested: DeepOpt?;
}

contract OptNestedOpt {
    foo: DeepMid;

    init() {
        self.foo = DeepMid{nested: null};
    }
}
