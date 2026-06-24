struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost?;
}

contract OptWrappedDepth {
    mid: Middle? = null;
}