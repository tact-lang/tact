struct OptionalStructLayer {
    layer: Int?;
}

struct OptionalStructWrap {
    inner: OptionalStructLayer?;
}

contract OptionalLayers {
    state: OptionalStructWrap?;

    init() {
        self.state = null;
    }
}