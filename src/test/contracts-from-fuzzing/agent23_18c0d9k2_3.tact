struct OptionalStruct {
    val: Int;
}

contract OptionalStructContract {
    optionalInner: OptionalStruct?;

    init() {
        self.optionalInner = null;
    }
}