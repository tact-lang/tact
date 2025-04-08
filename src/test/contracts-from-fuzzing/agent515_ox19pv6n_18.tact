message(777) Packet {
    seq: Int as uint32 = 123;
    flag: Bool = true;
}

contract Test {
    saved: Packet = Packet{};

    receive() {
        let _ = self.saved.seq;
    }
}