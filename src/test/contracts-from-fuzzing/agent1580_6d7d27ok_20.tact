struct OptionalInnerWithDefault {
    x: Int? = null;
    y: Bool = true;
}

contract OptInnerDefaultContract {
    inner: OptionalInnerWithDefault;

    init() {
        self.inner = OptionalInnerWithDefault{};
    }
}