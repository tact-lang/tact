struct OptionalLayer {
    nested: String?;
}

contract OptFieldContract {
    optLayer: OptionalLayer?;

    init() {
        self.optLayer = null;
    }
}