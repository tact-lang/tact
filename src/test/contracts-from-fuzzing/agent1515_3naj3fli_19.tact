struct InnerBool {
    val: Bool;
}

contract OptionalBoolStruct {
    inner: InnerBool?;

    init() {
        self.inner = null;
    }
}