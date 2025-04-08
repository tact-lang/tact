struct OptionalInner {
    val: Int;
    note: String?;
}

contract TestContract {
    data: OptionalInner?;
    init() {
        self.data = null;
    }
}