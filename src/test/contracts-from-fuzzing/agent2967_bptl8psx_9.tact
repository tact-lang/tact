struct OptionalInner {
    value: Int?;
}

contract OptionalInStruct {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ value: null };
    }
}