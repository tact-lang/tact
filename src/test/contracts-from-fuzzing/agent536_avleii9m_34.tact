message(1) Packet {
    amount: Int;
}

struct Wrapper {
    id: Int;
    payload: Packet;
}

contract OptWrapMsg {
    wrap: Wrapper? = null;

    init() {
        self.wrap = Wrapper{id:5, payload:Packet{amount:10}};
    }
}