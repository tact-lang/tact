message(33) SimpleMsg {
    text: String;
}

contract OptNestedMessage {
    saved: SimpleMsg?;

    init() {
        self.saved = null;
    }
}