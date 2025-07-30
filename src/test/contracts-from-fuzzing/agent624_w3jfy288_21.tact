message(0x42) DataPacket {
    foo: Int;
    bar: Bool;
}

contract MessageStructStorage {
    packet: DataPacket;

    init() {
        self.packet = DataPacket{
            foo: 12,
            bar: true,
        };
    }
}