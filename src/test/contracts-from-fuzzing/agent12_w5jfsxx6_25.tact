struct Inner {
    v: Int?;
}

contract OptPrimitiveInsideOptStructParam(
    inner: Inner?,
) {}