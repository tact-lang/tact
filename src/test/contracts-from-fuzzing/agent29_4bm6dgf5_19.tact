struct Layer {
    inner: InnerLayer?;
}

struct InnerLayer {
    val: Int;
}

contract OptionalInnerLayerTest {
    layer: Layer;

    init() {
        self.layer = Layer{
            inner:null,
        };
    }
}