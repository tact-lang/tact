struct MultiType {
    n: Int;
    b: Bool;
    s: String;
    addr: Address;
    sl: Slice;
    cl: Cell;
}

contract AllPrimitives {
    store: MultiType;
    init() {
        self.store = MultiType{
            n: 1,
            b: true,
            s: "hi",
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            cl: emptyCell()
        };
    }
}