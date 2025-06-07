struct WrappedInner {
    innerVal: Int;
}

contract OptionalStructParam(
    wrapper: WrappedInner?,
    id: Int,
) {
    receive() {
        // Dummy
    }
}