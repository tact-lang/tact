struct EmbeddedOpt {
    foo: Int;
    bar: Bool?;
}

contract EmbeddedOptTest {
    inner: EmbeddedOpt;

    init() {
        self.inner = EmbeddedOpt {
            foo: 7,
            bar: null
        };
    }
}
