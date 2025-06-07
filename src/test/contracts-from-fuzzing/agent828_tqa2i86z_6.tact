message(0x12) Payload {
    value: Int;
    flag: Bool;
}

contract TestContract {
    saved: Payload?;

    init() {
        self.saved = Payload{
            value: -42,
            flag: false
        };
    }
}