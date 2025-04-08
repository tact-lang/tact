struct InOpt {
    foo: Int;
}

struct OutOpt {
    nested: InOpt?;
    val: Bool;
}

contract OptWrap {
    store: OutOpt;

    init() {
        self.store = OutOpt{nested: null, val: false};
    }

    receive() {
        self.store.nested = InOpt{foo: 77};
    }
}