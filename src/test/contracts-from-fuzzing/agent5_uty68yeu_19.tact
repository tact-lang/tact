struct LayerInner {
    val: Int?;
}

struct LayerOuter {
    inner: LayerInner?;
}

contract MultiNestedParams(
    a: LayerOuter,
    b: LayerOuter
) {}