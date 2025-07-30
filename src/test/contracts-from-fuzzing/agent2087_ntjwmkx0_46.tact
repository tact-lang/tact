struct OptionalLayer {
    inner: Int?;
}

contract OptionalLayerTop {
    f: OptionalLayer;

    init() {
        self.f = OptionalLayer{inner:null};
    }
}