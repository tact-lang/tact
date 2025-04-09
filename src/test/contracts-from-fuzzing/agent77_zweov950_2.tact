struct OptionalInner {
    data: Int?;
}

contract Test {
    val: OptionalInner;
    init() {
        self.val = OptionalInner{ data: null };
    }
}