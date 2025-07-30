struct OptionalInner {
    message: String? = null;
}

contract ExplicitOptionalNull {
    val: OptionalInner;

    init() {
        self.val = OptionalInner{};
    }
}