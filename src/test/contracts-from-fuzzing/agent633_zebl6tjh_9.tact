struct Packet {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
}

contract PacketHolder {
    pkt: Packet;

    init() {
        self.pkt = Packet{
            a:1,
            b:true,
            c:emptyCell(),
            d:emptyCell().asSlice(),
            e:myAddress(),
            f:"hi",
            g:null,
            h:null,
            i:null,
            j:null
        };
    }
}