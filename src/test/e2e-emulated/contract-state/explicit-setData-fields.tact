message Msg1 {}
message Msg2 {}

contract Test {
    seqno: Int;

    init(seqno: Int) {
        self.seqno = seqno;
    }

    receive() {}

    receive(_: Msg1) {
        self.seqno += 1;
        setData(self.toCell());
        throw(0);
    }
    receive(_: Msg2) {
        self.seqno += 1;
    }

    get fun seqno(): Int {
        return self.seqno;
    }
}

asm fun setData(data: Cell) { c4 POP }
