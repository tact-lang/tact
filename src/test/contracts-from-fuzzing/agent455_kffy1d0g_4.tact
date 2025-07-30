struct OptionalInner {
    field: Int?;
}

contract OptionalStructStorage {
    state: OptionalInner?;

    init() {
        self.state = null;
    }
}