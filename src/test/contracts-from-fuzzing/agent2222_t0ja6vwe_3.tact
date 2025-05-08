struct OptionalInner {
    value: Int?;
}

contract TestContract {
    optData: OptionalInner;

    init() {
        self.optData = OptionalInner{ value: null };
    }
}