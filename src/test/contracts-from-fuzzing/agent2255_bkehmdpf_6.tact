struct MultiTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract AllFields {
    data: MultiTypes;

    init() {
        self.data = MultiTypes{
            i: 1,
            b: false,
            s: "test",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}
