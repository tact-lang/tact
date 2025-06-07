struct OptionalStringInner {
    text: String?;
}

contract OptionalStringInnerContract {
    inner: OptionalStringInner;

    init() {
        self.inner = OptionalStringInner{
            text: null
        };
    }
}