struct Composite {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    sl: Slice;
    cellVal: Cell;
}

contract AllTypes {
    s: Composite;
    init() {
        self.s = Composite{
            foo: 1,
            bar: true,
            baz: "test",
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            cellVal: emptyCell()
        };
    }
}