struct DeepOpt {
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract OptInStruct {
    foo: DeepOpt;

    init() {
        self.foo = DeepOpt { nested: null };
    }
}
