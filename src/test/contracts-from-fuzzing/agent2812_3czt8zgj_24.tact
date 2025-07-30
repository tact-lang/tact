struct BoolInner {
    b: Bool;
}

struct WrapInner {
    inner: BoolInner;
}

contract BoolNested(
    param: WrapInner,
) {}