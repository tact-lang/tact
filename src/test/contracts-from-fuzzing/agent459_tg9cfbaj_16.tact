message(1) Payload {
    code: Int;
}

contract OptionalMessageStore {
    maybeMsg: Payload? = null;

    init() {
        self.maybeMsg = Payload{ code: 100 };
    }
}