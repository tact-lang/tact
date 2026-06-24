struct OptionalInner {
    val: Int?;
}

contract OptionalNested {
    optStruct: OptionalInner;

    init() {
        self.optStruct = OptionalInner{ val: null };
    }
}
