message(1) Payload {
    count: Int;
    flag: Bool?;
}

contract TestContract {
    stored: Payload?;

    init() {
        self.stored = null;
    }
}