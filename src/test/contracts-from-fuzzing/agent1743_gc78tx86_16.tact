struct BigOptionalLayer {
    inner1: Int?;
    inner2: StructInner?;
}

struct StructInner {
    f1: Int;
    f2: String?;
}

contract OptionalLayers {
    data: BigOptionalLayer;

    init() {
        self.data = BigOptionalLayer{
            inner1: null,
            inner2: null,
        };
    }
}