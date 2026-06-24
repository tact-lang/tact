message(0x11111111) Info {
    code: Int;
    valid: Bool;
}

contract TestContract {
    optionalMessage: Info?;

    init() {
        self.optionalMessage = null;
    }
}