struct NullableDeepInner {
    a: Int?;
    b: Bool?;
}

struct NullableMiddle {
    inner: NullableDeepInner?;
    s: String?;
}

contract NullableLayers {
    layer: NullableMiddle?;

    init() {
        self.layer = null;
    }
}