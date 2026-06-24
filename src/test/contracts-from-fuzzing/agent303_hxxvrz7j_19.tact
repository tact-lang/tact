struct OptionalInnerStruct {
    id: Int;
    description: String;
}

contract OptionalStructContract {
    inner: OptionalInnerStruct?;

    init() {
        self.inner = null;
    }
}