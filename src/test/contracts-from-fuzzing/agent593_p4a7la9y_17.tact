struct OptionalInner {
    val: Int?;
}

contract OptionalStructStorage {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}