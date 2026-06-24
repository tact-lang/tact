struct OptEmbedded {
    x: Int;
    y: Bool;
}

contract OptionalEmbedded {
    inner: OptEmbedded?;

    init() {
        self.inner = null;
    }
}