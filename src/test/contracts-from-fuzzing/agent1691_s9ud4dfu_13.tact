struct OptionalLayer {
    inner: Layered?;
}

struct Layered {
    field: Bool?;
}

contract OptionalLayerTest {
    val: OptionalLayer;

    init() {
        self.val = OptionalLayer{
            inner: null
        };
    }
}