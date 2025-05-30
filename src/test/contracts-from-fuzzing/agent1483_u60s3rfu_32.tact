struct OptionalInnerBool {
    val: Bool?;
}

contract NestedOptBool {
    inner: OptionalInnerBool?;

    init() {
        self.inner = null;
    }
}