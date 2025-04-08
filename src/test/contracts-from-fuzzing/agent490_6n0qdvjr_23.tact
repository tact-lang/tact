struct Packet {
    flag: Bool;
    content: String?;
}

contract PacketHolder {
    data: Packet;
    init() {
        self.data = Packet{ flag: true, content: null };
    }
}