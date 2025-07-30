struct WrapInner {
    wrap: WrapTarget?;
}

struct WrapTarget {
    x: Int;
}

contract TargetWrap {
    inner: WrapInner = WrapInner{ wrap: null };
}