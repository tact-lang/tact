struct OptionalInner {
    text: String?;
    addr: Address?;
    sliceVal: Slice?;
}

contract OptionalStructContract {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{
            text: null,
            addr: null,
            sliceVal: null,
        };
    }
}