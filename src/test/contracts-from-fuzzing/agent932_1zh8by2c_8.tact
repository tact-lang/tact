struct OptionalInner {
    innerVal: Int?;
    anotherVal: Bool?;
}

contract StructWithOptionalInner {
    stored: OptionalInner;

    init() {
        self.stored = OptionalInner{innerVal: null, anotherVal: true};
    }
}
