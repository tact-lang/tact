struct OptionalLayer {
    inner: String?;
}

contract OptLayerTest {
    f: OptionalLayer = OptionalLayer { inner: null };

    init() {
        self.f = OptionalLayer { inner: "exists" };
    }
}
