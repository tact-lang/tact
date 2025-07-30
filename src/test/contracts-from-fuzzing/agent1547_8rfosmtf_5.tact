struct OptionalInner {
    label: String = "default";
    flag: Bool?;
}

contract OptionalStructContract {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner {
            flag: null
        };
    }
}