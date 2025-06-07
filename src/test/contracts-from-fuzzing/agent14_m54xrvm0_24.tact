struct Packet {
    prefix: Int as uint8;
    payload: Slice as remaining;
}

contract Test24 {
    opt: Packet?;

    init() {
        self.opt = null;
    }
}
