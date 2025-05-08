message(0x31415926) Minimal {}

struct OptionalMessage {
    maybeMsg: Minimal?;
}

contract TestOptMsg {
    f: OptionalMessage;
    init() {
        self.f = OptionalMessage{
            maybeMsg: null
        };
    }
}