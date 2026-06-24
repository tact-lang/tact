message(1) Payload {
    a: Int;
}

contract OptionalMessageField {
    payload: Payload?;

    init() {
        self.payload = null;
    }
}