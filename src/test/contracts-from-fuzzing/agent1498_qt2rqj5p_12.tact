struct Sequence {
    x: Int as uint8;
    y: Int as uint16;
    z: Int as uint32;
    w: Int as uint64;
}

contract TestContract {
    seq: Sequence;

    init() {
        self.seq = Sequence{
            x: 255,
            y: 65535,
            z: 4294967295,
            w: 18446744073709551615
        };
    }
}
