// test large persistent struct with a mix of all primitive supported types
struct PrimMix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract MixPersist {
    data: PrimMix;

    init() {
        self.data = PrimMix {
            i: 42,
            b: true,
            s: "ok",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}
