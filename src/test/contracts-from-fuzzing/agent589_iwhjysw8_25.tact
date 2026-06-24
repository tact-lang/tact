// Edge: optional of message struct as contract field

message(0x12345678) MTest {
    name: String;
    count: Int;
}

contract OptMsgField {
    optm: MTest?;

    init() {
        self.optm = null;
    }
}