struct Basic {
    a: Int;
}

struct WithOpt {
    inner: Basic?;
}

contract OptionalStructField {
    nested: WithOpt;

    init() {
        self.nested = WithOpt{ inner: null };
    }

    receive() {
        self.nested = WithOpt{ inner: Basic{ a: 5 } };
    }
}