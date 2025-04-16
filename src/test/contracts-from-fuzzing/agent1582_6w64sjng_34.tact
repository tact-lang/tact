struct OptionalEmbedded {
    inner: ComposeEmbedded?;
}

struct ComposeEmbedded {
    a: Int;
    b: Bool;
}

contract OptionalEmbeddedStructTest {
    v: OptionalEmbedded;
    init() {
        self.v = OptionalEmbedded{inner:null};
    }
}