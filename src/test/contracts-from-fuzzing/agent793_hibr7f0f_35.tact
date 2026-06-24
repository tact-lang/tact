struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract ContractOptionalInner {
    val: OptionalInner?;
    init() {
        self.val = null;
    }
}