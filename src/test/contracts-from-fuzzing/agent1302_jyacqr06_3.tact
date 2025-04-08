struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

struct DeeplyNested {
    inner: NestedOpt;
    flag: Bool;
}

contract DeepNestContract {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested {
            inner: NestedOpt { foo: null, bar: true },
            flag: false
        };
    }

    receive() {
        let v = self.state.inner.foo;
        let b = self.state.inner.bar;
        let f = self.state.flag;
    }
}
